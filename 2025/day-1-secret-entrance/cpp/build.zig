const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "main",
        .target = target,
        .optimize = optimize,
    });
    exe.addCSourceFile(.{
        .file = .{ .cwd_relative = "main.cc" },
        .flags = &.{"-std=c++17"},
    });
    exe.addCSourceFile(.{
        .file = .{ .cwd_relative = "secret_entrance.cc" },
        .flags = &.{"-std=c++23"},
    });
    exe.linkLibCpp();
    b.installArtifact(exe);

    const secret_entrance_lib = b.addStaticLibrary(.{
        .name = "secret_entrance",
        .target = target,
        .optimize = optimize,
    });
    secret_entrance_lib.addCSourceFile(.{
        .file = .{ .cwd_relative = "secret_entrance.cc" },
        .flags = &.{"-std=c++23"},
    });
    secret_entrance_lib.linkLibCpp();
    b.installArtifact(secret_entrance_lib);

    // GoogleTest Setup
    const gtest = b.addStaticLibrary(.{
        .name = "gtest",
        .target = target,
        .optimize = optimize,
    });

    const gtest_include_flags = [_][]const u8{
        "-std=c++23",
        "-Igoogletest/googletest/include",
        "-Igoogletest/googletest",
        "-pthread",
    };

    // automate the git clone if the googletest folder is not present
    const fetch_gtest = b.addSystemCommand(&.{
        "sh",
        "-c",
        "if [ ! -d googletest ]; then git clone https://github.com/google/googletest.git; fi",
    });

    gtest.step.dependOn(&fetch_gtest.step);

    gtest.addCSourceFile(.{
        .file = .{ .cwd_relative = "googletest/googletest/src/gtest-all.cc" },
        .flags = &gtest_include_flags,
    });
    gtest.addCSourceFile(.{
        .file = .{ .cwd_relative = "googletest/googletest/src/gtest_main.cc" },
        .flags = &gtest_include_flags,
    });
    gtest.linkLibCpp();

    // Test Executable
    const secret_entrance_test = b.addExecutable(.{
        .name = "secret_entrance_test",
        .target = target,
        .optimize = optimize,
    });
    secret_entrance_test.addCSourceFile(.{
        .file = .{ .cwd_relative = "secret_entrance_test.cc" },
        .flags = &.{
            "-std=c++17",
            "-Igoogletest/googletest/include",
            "-pthread",
        },
    });

    secret_entrance_test.linkLibrary(gtest);
    secret_entrance_test.linkLibrary(secret_entrance_lib);
    secret_entrance_test.linkLibCpp();
    b.installArtifact(secret_entrance_test);

    // fmt
    const format_step = b.step("fmt", "Format C++ code with clang-format");
    const cpp_files = &[_][]const u8{
        "main.cc",
        "secret_entrance.cc",
        "secret_entrance_test.cc",
    };
    for (cpp_files) |file| {
        const format_cmd = b.addSystemCommand(&.{ "clang-format", "-i", file });
        format_step.dependOn(&format_cmd.step);
    }

    // test
    const test_step = b.step("test", "Run GTest tests");
    const run_test_cmd = b.addRunArtifact(secret_entrance_test);
    test_step.dependOn(&run_test_cmd.step);

    // run
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "run app");
    run_step.dependOn(&run_cmd.step);
}
