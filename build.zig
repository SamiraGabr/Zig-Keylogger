const std = @import("std");

pub fn build(b: *std.Build) void {
    const mode = b.standardReleaseOptions();
    const target = b.standardTargetOptions(.{});

    const exe = b.addExecutable(.{
        .name = "zig-keylogger",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = mode,
    });

    exe.linkSystemLibrary("user32");
    exe.linkSystemLibrary("kernel32");

    b.installArtifact(exe);
}
