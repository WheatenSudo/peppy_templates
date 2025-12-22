# Spectrum Analyzer Templates

Spectrum analyzer visualizations for PeppyMeter Screensaver.

## Template Structure

Each spectrum template folder must contain:

```
template_name/
  spectrum.txt         - Spectrum configuration (required)
  *-bgr.png           - Background image (optional)
  *-bar.png           - Single bar segment image
  *-reflection.png    - Bar reflection image (optional)
```

## spectrum.txt Configuration

### Basic Spectrum Example

```ini
[spectrum-name]
spectrum.type = bar
channels = 2
ui.refresh.period = 0.033
size = 800,200
position = 0,280
bgr.filename = spectrum-bgr.png
bar.filename = spectrum-bar.png

# Bar layout
bars = 40
bar.width = 16
bar.height = 180
bar.gap = 4
max.value = 100

# Colors (if not using bar image)
base.color = 0,255,0
peak.color = 255,0,0
```

### Spectrum with Reflection

```ini
[spectrum-name]
spectrum.type = bar
channels = 2
ui.refresh.period = 0.033
size = 800,300
position = 0,180
bgr.filename = spectrum-bgr.png
bar.filename = spectrum-bar.png
reflection.filename = spectrum-reflection.png

bars = 32
bar.width = 20
bar.height = 150
bar.gap = 5
reflection.height = 75
reflection.gap = 5
max.value = 100
```

### Dual Channel (Stereo Split)

```ini
[spectrum-stereo]
spectrum.type = bar
channels = 2
ui.refresh.period = 0.033
size = 800,400
position = 0,80

# Left channel
left.bars = 20
left.x = 0
left.y = 0
left.direction = up

# Right channel
right.bars = 20
right.x = 400
right.y = 0
right.direction = up

bar.width = 16
bar.height = 180
bar.gap = 4
```

## Configuration Reference

### Spectrum Types

| Type | Description |
|------|-------------|
| bar | Vertical bar graph |
| pipe | Horizontal pipe/tube style |

### Direction Options

| Value | Description |
|-------|-------------|
| up | Bars grow upward (default) |
| down | Bars grow downward |
| left | Bars grow left (pipe type) |
| right | Bars grow right (pipe type) |

### Visual Parameters

| Option | Description |
|--------|-------------|
| bars | Number of frequency bars |
| bar.width | Width of each bar in pixels |
| bar.height | Maximum height of bars |
| bar.gap | Space between bars in pixels |
| max.value | Maximum amplitude value (default: 100) |

### Reflection Parameters

| Option | Description |
|--------|-------------|
| reflection.filename | Reflection bar image |
| reflection.height | Height of reflection |
| reflection.gap | Gap between bar and reflection |
| reflection.opacity | Opacity 0-255 (default: 128) |

### Color Options

If not using bar images, colors can be specified:

| Option | Description |
|--------|-------------|
| base.color | Bar base color (R,G,B) |
| mid.color | Bar middle color (R,G,B) |
| peak.color | Bar peak color (R,G,B) |
| background.color | Background fill color |

### Animation

| Option | Description |
|--------|-------------|
| ui.refresh.period | Update interval in seconds (0.033 = 30fps) |
| fall.speed | Peak fall speed |
| peak.hold | Peak hold time in frames |

## Image Requirements

### Bar Image
- Single bar segment at maximum height
- PNG with transparency
- Will be scaled/clipped based on amplitude

### Reflection Image
- Inverted/faded version of bar
- PNG with transparency
- Typically 50% height of main bar

### Background
- Full spectrum area background
- PNG or JPG
- Size should match spectrum size parameter

## Integrating with VU Meters

Spectrum can be combined with VU meters in meters.txt:

```ini
[meter-with-spectrum]
meter.type = circular
# ... meter configuration ...

# Enable spectrum overlay
config.extend = True
meter.visible = True
spectrum.visible = True
spectrum.name = s.1
spectrum.size = 800,150
```

The `spectrum.name` must match a section in spectrum.txt.

## FFT Configuration

Advanced FFT settings (usually defaults are fine):

```ini
fft.size = 2048
fft.window = hanning
frequency.min = 20
frequency.max = 20000
scale = logarithmic
```

| Option | Description |
|--------|-------------|
| fft.size | FFT window size (power of 2) |
| fft.window | Window function (hanning, hamming, blackman) |
| frequency.min | Minimum frequency in Hz |
| frequency.max | Maximum frequency in Hz |
| scale | Frequency scale (linear, logarithmic) |

## Performance Tips

1. Fewer bars = better performance (20-40 recommended for Pi)
2. Smaller spectrum size reduces CPU load
3. Longer refresh period (0.05) saves CPU but looks choppier
4. Avoid transparency in backgrounds when possible

## Testing

Test your spectrum template:

1. Copy to templates_spectrum folder
2. Reference in meters.txt with spectrum.name
3. Play music with varied frequency content
4. Verify bars respond to audio levels
5. Check CPU usage is acceptable

## Submitting Templates

1. Create folder with your template name
2. Include all required files
3. Add screenshot as `preview.jpg` or `preview.png`
4. Note any special requirements (resolution, dependencies)
5. Submit pull request to this repository
