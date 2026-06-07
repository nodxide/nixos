_:

{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # Electron / Chromium apps
      MOZ_ENABLE_WAYLAND = "1";
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1"; # Better HiDPI handling
      __GLX_VENDOR_LIBRARY_NAME = "mesa"; # Force Mesa for OpenGL
      GBM_BACKEND = "amdgpu"; # AMD GBM backend
      AMD_VULKAN_ICD = "RADV"; # Use RADV (best open driver)
      WLR_RENDERER = "vulkan"; # Prefer Vulkan renderer
      NIRI_DISABLE_XWAYLAND = "0";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
