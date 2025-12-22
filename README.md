# PeppyMeter Templates

Community collection of meter skins and spectrum visualizations for [PeppyMeter Screensaver](https://github.com/foonerd/peppy_screensaver).

## Contents

| Folder | Description |
|--------|-------------|
| [templates](templates/) | VU meter skins (circular, linear) |
| [templates_spectrum](templates_spectrum/) | Spectrum analyzer visualizations |

## Installation

### Quick Install (Single Template)

1. Download the template folder you want
2. Copy to your Volumio device:
   ```bash
   scp -r template_folder volumio@volumio.local:/data/INTERNAL/peppy_screensaver/templates/
   ```
3. Restart the plugin or reboot

### Full Collection Install

```bash
# On your Volumio device
cd /data/INTERNAL/peppy_screensaver
git clone --depth=1 https://github.com/foonerd/peppy_templates.git temp_clone
cp -r temp_clone/templates/* templates/
cp -r temp_clone/templates_spectrum/* templates_spectrum/
rm -rf temp_clone
```

### Template Location

Templates are stored in:
```
/data/INTERNAL/peppy_screensaver/templates/          - VU meters
/data/INTERNAL/peppy_screensaver/templates_spectrum/ - Spectrum analyzers
```

## Using Templates

1. Open Volumio web interface
2. Settings > Plugins > PeppyMeter Screensaver > Settings
3. Select template folder from dropdown
4. Choose specific meter/spectrum from the list
5. Save and restart screensaver

## Resolution Folders

Templates are organized by screen resolution:

| Folder | Resolution | Common Displays |
|--------|------------|-----------------|
| 800x480 | 800x480 | Official Pi 7" touchscreen |
| 1024x600 | 1024x600 | Many 7" HDMI displays |
| 1280x720 | 1280x720 (720p) | HD displays |
| 1920x1080 | 1920x1080 (1080p) | Full HD displays |

Choose the folder matching your display resolution for best results.

## Contributing

Contributions welcome! See individual folder READMEs for structure requirements:

- [Template Structure](templates/README.md)
- [Spectrum Structure](templates_spectrum/README.md)

### Submission Guidelines

1. Fork this repository
2. Add your template in the appropriate resolution folder
3. Include all required files (see folder READMEs)
4. Test on actual hardware before submitting
5. Submit a pull request with:
   - Template name and description
   - Screenshot(s)
   - Your name/handle for credits

### Naming Convention

```
[resolution]/[name]/
```

Examples:
- `800x480/my-custom-meter/`
- `1920x1080/neon-spectrum/`

Use lowercase, hyphens for spaces. Avoid special characters.

## Credits

Templates in this collection are contributed by the community. Individual credits are listed in each template's folder or meters.txt file.

- Original PeppyMeter: [project-owner](https://github.com/project-owner)
- Template contributions: Various community members

## License

Individual templates may have their own licenses. Unless otherwise specified, templates are provided under MIT license for personal and non-commercial use.

## Related

- [PeppyMeter Screensaver Plugin](https://github.com/foonerd/peppy_screensaver)
- [PeppyMeter Build Tools](https://github.com/foonerd/peppy_builds)
- [Original PeppyMeter](https://github.com/project-owner/PeppyMeter)
- [Original PeppySpectrum](https://github.com/project-owner/PeppySpectrum)
