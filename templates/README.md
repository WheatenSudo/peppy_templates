# VU Meter Templates

VU meter skins for PeppyMeter Screensaver.

## Template Structure

Each template folder must contain:

```
template_name/
  meters.txt           - Meter configuration (required)
  *-bgr.png           - Background image
  *-fgr.png           - Foreground/overlay image (optional)
  *-needle.png        - Needle indicator (circular meters)
  *-indicator.png     - Bar indicator (linear meters)
  *-ext.jpg           - Extended background (full screen)
  *-msk.jpg           - Album art mask (optional)
```

## meters.txt Configuration

### Circular Meter Example

```ini
[meter-name]
meter.type = circular
channels = 2
ui.refresh.period = 0.033
bgr.filename = meter-bgr.png
fgr.filename = meter-fgr.png
indicator.filename = meter-needle.png
steps.per.degree = 4
start.angle = 45
stop.angle = -45
distance = 100
left.origin.x = 200
left.origin.y = 200
right.origin.x = 600
right.origin.y = 200
meter.x = 0
meter.y = 100
screen.bgr = meter-ext.jpg
```

### Linear Meter Example

```ini
[meter-name]
meter.type = linear
channels = 2
ui.refresh.period = 0.033
bgr.filename = meter-bgr.png
fgr.filename = meter-fgr.png
indicator.filename = meter-indicator.png
left.x = 20
left.y = 50
right.x = 20
right.y = 150
position.regular = 10
position.overload = 2
step.width.regular = 8
step.width.overload = 8
direction = left-right
meter.x = 0
meter.y = 0
screen.bgr = meter-ext.jpg
```

### Volumio Extended Configuration

Add these options for metadata display:

```ini
# --- volumio optional entries -------
config.extend = True
meter.visible = True

# Album art
albumart.pos = 20,20
albumart.dimension = 200,200
albumart.border = 1
albumart.rotation = True
albumart.rotation.speed = 6

# Track info
playinfo.title.pos = 250,30,bold
playinfo.title.color = 255,255,255
playinfo.title.maxwidth = 400

playinfo.artist.pos = 250,60,regular
playinfo.artist.color = 200,200,200
playinfo.artist.maxwidth = 400

playinfo.album.pos = 250,90,light
playinfo.album.color = 180,180,180
playinfo.album.maxwidth = 400

playinfo.center = False

# Format icon and sample rate
playinfo.type.pos = 700,30
playinfo.type.color = 255,255,255
playinfo.type.dimension = 32,32
playinfo.samplerate.pos = 700,70,regular
playinfo.samplerate.maxwidth = 100

# Time remaining
time.remaining.pos = 700,120
time.remaining.color = 255,255,255

# Fonts
font.size.digi = 28
font.size.light = 14
font.size.regular = 16
font.size.bold = 18
font.color = 255,255,255
```

## Configuration Reference

### Meter Types

| Type | Description |
|------|-------------|
| circular | Needle/dial style VU meter |
| linear | Bar graph style meter |

### Position Style Suffixes

Append to position values: `playinfo.title.pos = 250,30,bold`

| Suffix | Font Style |
|--------|------------|
| bold | Bold font |
| regular | Regular font |
| light | Light font |

### Color Format

RGB values 0-255: `playinfo.title.color = 255,200,100`

### Album Art Options

| Option | Description |
|--------|-------------|
| albumart.pos | X,Y position |
| albumart.dimension | Width,Height |
| albumart.border | Border width in pixels (0 = none) |
| albumart.mask | Mask image for shaped album art |
| albumart.rotation | Enable LP rotation effect (True/False) |
| albumart.rotation.speed | Rotation speed in RPM (default: 6) |

## Image Requirements

### Background (bgr)
- Full meter background
- PNG with transparency supported
- Size should match meter.x/meter.y positioning

### Foreground (fgr)
- Overlay drawn on top of needles
- PNG with transparency required
- Used for glass effects, shadows, etc.

### Extended Background (ext)
- Full screen background
- JPG or PNG
- Must match screen resolution exactly

### Needle/Indicator
- PNG with transparency required
- Pivot point at image center for circular meters
- For linear meters, represents single bar segment

### Mask
- Grayscale JPG
- White = visible, Black = transparent
- Used to shape album art (rounded corners, circles, etc.)

## Multiple Meters Per File

meters.txt can contain multiple meter definitions:

```ini
[meter-one]
meter.type = circular
...

[meter-two]
meter.type = linear
...

[meter-three-spectrum]
meter.type = circular
meter.visible = False
spectrum.visible = True
spectrum.name = s.1
spectrum.size = 800,200
...
```

## Testing

Test your template before submitting:

1. Copy to templates folder on Volumio
2. Select in plugin settings
3. Verify all elements display correctly
4. Test with various track metadata lengths
5. Check CPU usage is reasonable

## Submitting Templates

1. Create folder with your template name
2. Include all required files
3. Add screenshot as `preview.jpg` or `preview.png`
4. Submit pull request to this repository
