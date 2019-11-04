# Packages
PRODUCT_PACKAGES += \
    WallpaperPicker2 \
    CustomDoze \
    ThemePicker \
    NexusLauncherRelease \
    NexusLauncherReleaseOverlay \
    PixelSetupWizardOverlay \
    PixelSetupWizardAodOverlay \
    PixelThemes \
    GalleryGoPrebuilt \
    Recorder \
    SettingsIntelligenceGooglePrebuilt \
    SoundPickerPrebuilt

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni
