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
        .file = .{ .cwd_relative = "day_one.cc" },
        .flags = &.{"-std=c++17"},
    });
    exe.linkLibCpp();
    b.installArtifact(exe);

    const day_one_lib = b.addStaticLibrary(.{
        .name = "day_one",
        .target = target,
        .optimize = optimize,
    });
    day_one_lib.addCSourceFile(.{
        .file = .{ .cwd_relative = "day_one.cc" },
        .flags = &.{"-std=c++17"},
    });
    day_one_lib.linkLibCpp();
    b.installArtifact(day_one_lib);

    // GoogleTest Setup
    const gtest = b.addStaticLibrary(.{
        .name = "gtest",
        .target = target,
        .optimize = optimize,
    });

    const gtest_include_flags = [_][]const u8{
        "-std=c++17",
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
    const day_one_test = b.addExecutable(.{
        .name = "day_one_test",
        .target = target,
        .optimize = optimize,
    });
    day_one_test.addCSourceFile(.{
        .file = .{ .cwd_relative = "day_one_test.cc" },
        .flags = &.{
            "-std=c++17",
            "-Igoogletest/googletest/include",
            "-pthread",
        },
    });

    day_one_test.linkLibrary(gtest);
    day_one_test.linkLibrary(day_one_lib);
    day_one_test.linkLibCpp();
    b.installArtifact(day_one_test);

    // fmt
    const format_step = b.step("fmt", "Format C++ code with clang-format");
    const cpp_files = &[_][]const u8{
        "main.cc",
        "day_one.cc",
        "day_one_test.cc",
    };
    for (cpp_files) |file| {
        const format_cmd = b.addSystemCommand(&.{ "clang-format", "-i", file });
        format_step.dependOn(&format_cmd.step);
    }

    // test
    const test_step = b.step("test", "Run GTest tests");
    const run_test_cmd = b.addRunArtifact(day_one_test);
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
