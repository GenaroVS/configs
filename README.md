## Neovim for Windows
- Windows Config: C:\Users\[user]\AppData\Local\nvim
- Linux Config: ~/HOME/.config/nvim

### Treesitter
- make sure to use visual studio developer command prompt to have CL (C compiler) installed in your PATH.
- Might have to run ```C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat x64``` to install C compiler
- Treesitter installs with precompiled parsers .so files for POSIX, you need to uninstall .so parsers and reinstall so that Treesitter recognizes Windows OS and compiles to DDL.
  - TSInstall, TSUninstall, TSInstallInfo
### Clangd LSP
- For windows SDK installed via visual studio, add .clangd config at project root

```
CompileFlags:
  Add: [
    -Wall, -Wextra,
    -IC:/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/um,
    -IC:/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/shared,
    -IC:/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/winrt,
    -IC:/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/cppwinrt,
    -IC:/Program Files (x86)/Windows Kits/1v/Include/10.0.26100.0/ucrt,
    -IC:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.44.35207/include
]
```
