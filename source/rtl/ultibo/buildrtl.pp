{This unit has no function and is only used for editing (not building) the RTL with Lazarus}
unit buildrtl;

interface

uses
 {FPC RTL Units}
 system,
 uuchar,
 objpas,
 iso7185,
 extpas,
 strings,
 sysutils,
 math,
 classes,
 fgl,
 macpas,
 typinfo,
 types,
 rtlconsts,
 getopts,
 lineinfo,
  
 dos,
 ctypes,
 charset,
 cpall,
 sysconst,
 character,
 fpwidestring,
 
 {Ultibo Boot/Platform Units (ARM)}
 platformarm,
 
 {Ultibo Boot/Platform Units (ARMv6)}
 bootrpi,
 bcm2835,
 bcm2708,
 platformarmv6,
 platformrpi,
 
 {Ultibo Boot/Platform Units (ARMv7)}
 bootrpi2,
 bootbpi,
 bootbpro,
 bootbbb,
 bootcuboxi,
 bootodroidc1,
 bootodroidu3,
 bootodroidxu3,
 bootpcduino,
 bootqemuvpb,
 bcm2836,
 bcm2709,
 allwinnera20,
 allwinnerh3,
 freescaleimx6,
 versatilepb,
 platformarmv7,
 platformrpi2,
 platformbpi,
 platformbpro,
 platformbbb,
 platformcuboxi,
 platformodroidc1,
 platformodroidu3,
 platformodroidxu3,
 platformpcduino,
 platformqemuvpb,
 
 {Ultibo Boot/Platform Units (AARCH64)}
 platformaarch64,
 
 {Ultibo Boot/Platform Units (ARMv8)}
 bootrpi3,
 bcm2837,
 bcm2710,
 platformarmv8,
 platformrpi3,
 
 {Ultibo Boot/Platform Units (MIPS)}
 bootci20,
 platformmips,
 platformmips32,
 platformci20,
                       
 {Ultibo Boot/Platform Units (x86)}
 bootpcx86,
 platformx86,
 platformpc,
 
 {Ultibo Boot/Platform Units (x86_64)}
 bootpcx86_64,
 platformx86_64,
 
 {Ultibo RTL Units}
 globalconfig,
 globalconst,
 globaltypes,
 globalstrings,
 globalsock,
 heapmanager,
 platform,
 locale,
 unicode,
 threads,
 devices,
 framebuffer,
 dma,
 font,
 console,
 logging,
 serial,
 uart,
 i2c,
 spi,
 i2s,
 pwm,
 w1,
 rtc,
 usb,
 usbcdc,
 mmc,
 mmcspi,
 bluetooth,
 gpio,
 wiring,
 ahci,
 ehci,
 xhci,
 dwcotg,
 keymap,
 keyboard,
 mouse,
 ataoe,
 atapi,
 scsi,
 codec,
 audio,
 video,
 mpeg,
 dvb,
 dab,
 dfu,
 tftframebuffer,
 vc4,
 gc880,
 gc2000,
 mali400,
 mali450,
 crypto,
 ssl,
 security,
 authentication,
 timezone,
 ultibo,
 ultiboutils,
 ultiboclasses,
 network,
 loopback,
 transport,
 protocol,
 arp,
 ip,
 ipv6,
 icmp,
 icmpv6,
 raw,
 udp,
 tcp,
 igmp,
 dhcp,
 dns,
 vpn,
 wifi,
 smsc95xx,
 sockets,
 winsock,
 winsock2,
 iphlpapi,
 ftp,
 http,
 imap4,
 ldap,
 pop3,
 smtp,
 sip,
 xmpp,
 storage,
 filesystem,
 extfs,
 fatfs,
 cdfs,
 ntfsconst,
 ntfstypes,
 ntfsutils,
 ntfsclass,
 ntfs,
 virtualdisk,
 iscsi,
 nfs,
 cifs,
 services,
 shell,
 graphicsconsole,
 syscalls,
 
 {Ultibo CodePage Units} 
 cp720oem,
 cp737oem,
 cp775oem,
 cp850oem,
 cp852oem,
 cp857oem,
 cp862oem,
 cp866oem,
 cp874ansi,
 cp1250ansi,
 cp1251ansi,
 cp1253ansi,
 cp1254ansi,
 cp1255ansi,
 cp1256ansi,
 cp1257ansi,
 cp1258ansi,
 
 {Ultibo Driver Units} 
 af16x2lcd,
 ds1307,
 ftdiserial,
 hd44780,
 hx8357d,
 ili9340,
 mcp230xx,
 pitft28,
 pitft35,
 pl011,
 pl110,
 pl2303,
 rpift5406,
 rt2x00lib,
 rt2x00usb,
 rt2800lib,
 rt2800usb,
 rtl8188eu,
 rtl8192cu,
 rtlwifi,
 stmpe,
 usbcdcacm,
 
 {Ultibo Font Units} 
 Latin1_8x8,
 Latin1_8x10,
 Latin1_8x12,
 Latin1_8x14,
 Sun_12x22,
 
 {Ultibo Keymap Units} 
 keymap_de,
 keymap_es,
 keymap_fr,
 keymap_uk,
 keymap_us,
 keymap_us_intl,
 
 {Ultibo Extra Units} 
 ConsoleShell,
 RemoteShell,
 ShellFilesystem,
 ShellUpdate,
 WebStatus,
 
 WiringI2C,
 WiringSerial,
 WiringSPI,
 
 RaspberryPi,
 RaspberryPi2,
 RaspberryPi3,
 QEMUVersatilePB;

implementation

end.