#Rotario 🌀 ASCII 3D Renderer

Rotario is a tiny 3D engine, 100% text-based, self-contained running in terminal like a dream from the demoscene of 90s... but in 2025
It turns any PNG image (using its alpha channel) into a real-time ASCII 3D animation—all with zero graphical dependencies, just pure C, a bit of Python, and plenty of naughty trigonometry

** Python ** 
Loads the image and resizes it to 128×128.
Extracts the alpha channel.
Detects edges using 8-connectivity neighborhood analysis.
Encodes the local contour angle into 32 directions → stored as an ASCII character ('0' to '@').
Fully opaque pixels become '!'.

** ⚡ C **
Each non-empty pixel becomes a 3D column (implicit geometry ✨).
Planar rotation around the Y-axis:
rx = x·cos(t) - z·sin(t), rz = x·sin(t) + z·cos(t)
Simplified perspective: p = 0.8 × (1 + rz)
Custom Lambertian lighting:
luminance = max(0, dot(normal, light_dir))
Hand-rolled Z-buffer to handle occlusions.
Software rasterization → ASCII output using the palette:
" .,-~:;=!*#$@"

** Rotario's just **
implicit geometry,
basic trigonometry,
normal reconstruction from 2D contours,
and a touch of terminal demoscene magic
