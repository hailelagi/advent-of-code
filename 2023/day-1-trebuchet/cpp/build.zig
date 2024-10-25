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

    // Test Lib
    const day_one_test = b.addExecutable(.{
        .name = "day_one_test",
        .target = target,
        .optimize = optimize,
    });
    day_one_test.addCSourceFile(.{
        .file = .{ .cwd_relative = "day_one_test.cc" },
        .flags = &.{"-std=c++17"},
    });

    // TODO: figure out how to pull in gtest

    day_one_test.linkLibCpp();

    // Install the test executable
    b.installArtifact(day_one_test);

    const test_step = b.step("test", "Run library tests");
    const run_test_cmd = b.addRunArtifact(day_one_test);
    test_step.dependOn(&run_test_cmd.step);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
