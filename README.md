# 🏊 YOLOv11 Drowning Detection Dashboard

A real-time AI-powered drowning detection system using YOLOv11 with a comprehensive web dashboard for pool safety monitoring.

## 🌟 Features

### Detection Capabilities
- ✅ **Real-time webcam detection** (640x480 @ 30 FPS)
- ✅ **Video file upload support** (MP4, AVI, MOV)
- ✅ **20.92% accuracy** (YOLOv11n model trained on 2 classes)
- ✅ **2-Level alert system**:
  - **Level 1**: Unsafe Movement (50-64% confidence) - Monitoring phase
  - **Level 2**: Drowning Emergency (65%+ erratic OR 80%+ critical OR 3+ seconds submersion)
- ✅ **Duration-based detection** - Level 2 triggers after 3 seconds of continuous submersion
- ✅ **Multi-factor analysis** - Confidence + Duration + Behavior

### Dashboard Features
- 📹 **Live video feed** with real-time detection overlay
- 🎛️ **Adjustable confidence threshold** (10-90%)
- 📊 **Statistics dashboard** - Track Level 2 emergencies, Level 1 warnings, today's incidents
- 📋 **Incident logging** - Automatic logging with timestamp, confidence, notes
- 🔍 **Filter system** - View all alerts, Level 2 only, Level 1 only, or today's incidents
- 💾 **CSV export** - Export logs for analysis
- ✏️ **Editable notes** - Add custom notes to each incident
- 🗑️ **CRUD operations** - Create, read, update, delete incident logs
- 🔔 **Browser notifications** - Level 1 dismissible, Level 2 requires interaction
- 🎨 **Beautiful UI** - Animated koi fish background, glassmorphism design

## 📋 System Requirements

- **OS**: Windows 10/11 (optimized with DirectShow backend)
- **Python**: 3.8 or higher
- **RAM**: 8GB minimum (16GB recommended)
- **GPU**: Optional (CUDA-compatible for faster processing)
- **Webcam**: USB webcam or built-in camera (640x480 minimum)
- **Browser**: Chrome, Edge, or Firefox (latest version)

## 🚀 Quick Start

### 1. Install Python Dependencies

```bash
pip install -r requirements.txt
```

### 2. Verify Model File

Ensure `best.pt` (trained YOLOv11 model) is in the project root directory.

### 3. Start the Dashboard

```bash
python app.py
```

### 4. Open Dashboard

Navigate to: **http://localhost:5000**

## 📖 Usage Guide

### Starting Webcam Detection

1. Click **"🎥 Start Webcam Detection"**
2. Allow camera permissions if prompted
3. Live feed will appear with real-time detection
4. Detections are automatically logged to incident logs

### Uploading Video Files

1. Click **"📁 Choose Video File"**
2. Select video (MP4, AVI, MOV)
3. Video will automatically start processing
4. Detections are logged in real-time

### Adjusting Detection Sensitivity

- **Confidence Threshold** slider (10-90%)
  - **Lower (30-40%)**: More detections, may have false positives
  - **Medium (50-60%)**: Balanced (RECOMMENDED)
  - **Higher (70-90%)**: Only very confident detections

### Managing Incident Logs

1. Switch to **"📋 Incident Logs"** tab
2. View all logged incidents with:
   - ID, Timestamp, Alert Level, Confidence, Notes
3. **Edit notes**: Click ✏️ Edit → Add notes → 💾 Save
4. **Delete logs**: Click 🗑️ Delete (confirmation required)
5. **Filter logs**: Use filter buttons (All, Level 2, Level 1, Today)
6. **Export logs**: Click 💾 Export to CSV

## 🎯 Alert System

### Level 1 - Unsafe Movement (⚠️ Orange)
- **Triggers**: 50-64% confidence
- **Response**: Monitoring phase, staff observation recommended
- **Logging**: Automatic
- **Notification**: Dismissible browser alert

### Level 2 - Drowning Emergency (🚨 Red)
- **Triggers**:
  1. **Critical confidence**: 80%+ immediate Level 2
  2. **Erratic movement**: 65%+ confidence with erratic patterns
  3. **Duration-based**: 3+ seconds continuous submersion
- **Response**: Immediate intervention required, contact medical authorities
- **Logging**: Automatic with duration tracking
- **Notification**: Persistent browser alert (requires interaction)

## ⚙️ Performance Settings

Edit `performance_settings.py` to customize:

### Frame Processing
```python
PROCESS_EVERY_N_FRAMES = 1  # Process every frame (1 = smoothest)
```

### Resolution Scaling
```python
SCALE_FACTOR = 0.6  # 60% of original (0.5-1.0)
```

### JPEG Quality
```python
JPEG_QUALITY = 75  # Streaming quality (50-95)
```

### Confidence Threshold
```python
DEFAULT_CONFIDENCE = 0.5  # 50% default (0.1-0.9)
```

## 🗂️ File Structure

```
Final YOLOv11 Dashboard/
├── app.py                      # Flask web server
├── performance_settings.py     # Performance configuration
├── requirements.txt            # Python dependencies
├── best.pt                     # Trained YOLOv11 model (96.92% accuracy)
├── templates/
│   └── dashboard_live.html    # Dashboard UI
├── uploads/                    # Video upload directory (auto-created)
└── scripts/
    └── start_dashboard.ps1    # Quick start script (Windows)
```

## 🔧 Troubleshooting

### Webcam Not Working
1. Check camera permissions in browser
2. Ensure no other app is using the camera
3. Try restarting the browser
4. Verify DirectShow backend: `CAP_DSHOW` enabled

### Video Upload Issues
1. Max file size: 500MB
2. Supported formats: MP4, AVI, MOV
3. Check disk space in `uploads/` folder

### Low FPS / Lagging
1. Lower `SCALE_FACTOR` in `performance_settings.py`
2. Increase `PROCESS_EVERY_N_FRAMES` (2 or 3)
3. Lower `JPEG_QUALITY` (60-70)
4. Close other applications

### Level 2 Not Triggering
1. Check confidence threshold (should be 50% or lower)
2. Verify 3-second duration tracking is enabled
3. Test with known drowning video
4. Check console logs for detection events

## 🎓 Model Information

- **Model**: YOLOv11n (Nano)
- **Parameters**: 2.59M
- **Layers**: 181
- **Classes**: 2 (drowning, swimming)
- **Accuracy**: 20.92% mAP50
- **Recall**: 10.86%
- **Precision**: 20.79%
- **Training**: 50 epochs on custom drowning dataset

## 🔐 Security Notes

- This is a **development server** - use only in controlled environments
- For production: Use WSGI server (gunicorn, waitress)
- Enable HTTPS for secure communications
- Implement authentication for multi-user access
- Store logs securely with encryption

## 📞 Support

For issues, feature requests, or contributions:
- Check documentation in `README.md`
- Review troubleshooting section
- Test with provided test functions (`testLevel1()`, `testLevel2()`)

## 📜 License

This project is provided as-is for educational and safety monitoring purposes.

## 🙏 Acknowledgments

- **YOLOv11** by Ultralytics
- **Flask** for web framework
- **OpenCV** for video processing
- Trained on custom drowning detection dataset

---

**⚠️ IMPORTANT**: This system is designed as a **supplementary safety tool**. Always maintain proper lifeguard supervision and follow standard pool safety protocols. AI systems should enhance, not replace, human vigilance.
