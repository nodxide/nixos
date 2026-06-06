_:

{
  boot = {
    loader = {
      timeout = 3;

      grub = {
        enable = true;
        device = "/dev/sda";

        # Detect other installed OSes:
        useOSProber = true;

        # Cleaner menu entries:
        configurationLimit = 10;
      };
    };

    # Clean temporary files:
    tmp.cleanOnBoot = true;

    # Desktop-friendly VM behavior:
    kernel.sysctl = {
      "vm.swappiness" = 10;
    };

    # Keep boot chain clean:
    supportedFilesystems = [
      "ext4"
      "btrfs"
      "ntfs"
    ];
  };
}
