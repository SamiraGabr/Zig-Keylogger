# `zig-keylogger`

## Project Overview

This project is a simple, educational **keylogger built entirely in Zig for Windows**. It demonstrates low-level input handling and file I/O, providing a practical example of a red team tool.

-----

## Legal & Ethical Warning

This project is intended for **educational and red team research purposes only** within your own controlled lab or testing environment. **Do not deploy this on any system you do not own or for which you lack explicit, written permission.** Unauthorized access or monitoring is illegal and unethical.

-----

## Features

  * **Logs Keypresses:** Utilizes the Windows API (`GetAsyncKeyState`) to capture keyboard input.
  * **Writes to File:** Records all captured keypresses to a designated log file.
  * **Background Operation:** Designed to run continuously in the background.
  * **Zig-only:** Built purely with Zig, requiring no external libraries beyond standard system dependencies.

-----

## Project Structure

```
zig-keylogger/
├── build.zig
└── src/
    └── main.zig
```

-----

## Build & Run

### Prerequisites

  * [Zig Compiler](https://ziglang.org/download/) installed on your system.

### Steps

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/Samira-Gabr/zig-keylogger.git
    cd zig-keylogger
    ```

2.  **Build the executable:**

    ```bash
    zig build
    ```

3.  **Run the keylogger:**

    ```bash
    .\zig-out\bin\zig-keylogger.exe
    ```

4.  **Check the logs:**
    All captured keypresses will be written to `keylog.txt` in the same directory as the executable.

-----

## Next Steps & Potential Enhancements

This project provides a basic foundation. Consider these enhancements to expand its capabilities:

  * **Handle More Keys:** Improve `keyToPrintable` to accurately log special keys like Enter, Backspace, Tab, and symbols (e.g., `!`, `@`, `#`).
  * **Hide Console Window:** Implement `ShowWindow(GetConsoleWindow(), SW_HIDE)` to make the keylogger run in the background without a visible console window.
  * **Encrypt Log Output:** Encrypt the contents of `keylog.txt` to prevent easy readability if the file is discovered.
  * **Exfiltrate Logs:** Implement a mechanism to periodically send the logs over a network (e.g., HTTP, DNS, or custom TCP/UDP) to a remote server.
  * **Persistence:** Add methods to ensure the keylogger restarts after system reboots.

-----
