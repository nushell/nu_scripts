export-env {
  let-env MSVS_BASE_PATH = $env.Path

  let info = (
      if not (which vswhere | is-empty) {
        (vswhere -format json | from json)
      } else {
        ('{"installationPath": [""]}' | from json)
      }
  )

  let-env MSVS_ROOT = ($info.installationPath.0 | str replace -a '\\' '/')

  let-env MSVS_MSVC_ROOT = (
      if not ($"($env.MSVS_ROOT)/VC/Tools/MSVC/" | path exists) {
        ""
      } else if (ls $"($env.MSVS_ROOT)/VC/Tools/MSVC/*" | is-empty) {
        ""
      } else {
        ((ls $"($env.MSVS_ROOT)/VC/Tools/MSVC/*").name.0 | str replace -a '\\' '/')
      })

  let-env MSVS_MSDK_ROOT = (REG QUERY 'HKLM\SOFTWARE\Wow6432Node\Microsoft\Microsoft SDKs\Windows\v10.0' /v "InstallationFolder" | str replace '(.|\n)+REG_SZ\s+(.+)' "$2")
  let-env MSVS_MSDK_ROOT = ($env.MSVS_MSDK_ROOT | str replace -a '\\' '/')

  let-env MSVS_MSDK_VER = (REG QUERY 'HKLM\SOFTWARE\Wow6432Node\Microsoft\Microsoft SDKs\Windows\v10.0' /v "ProductVersion" | str replace '(.|\n)+REG_SZ\s+(.+)' "$2")
  let-env MSVS_MSDK_VER = $"($env.MSVS_MSDK_VER).0"

  let-env MSVS_INCLUDE_PATH = ([
    $"($env.MSVS_ROOT)/Include/($env.MSVS_MSDK_VER)/cppwinrt/winrt",
    $"($env.MSVS_MSVC_ROOT)/include",
    $"($env.MSVS_MSDK_ROOT)Include/($env.MSVS_MSDK_VER)/cppwinrt/winrt",
    $"($env.MSVS_MSDK_ROOT)Include/($env.MSVS_MSDK_VER)/shared",
    $"($env.MSVS_MSDK_ROOT)Include/($env.MSVS_MSDK_VER)/ucrt",
    $"($env.MSVS_MSDK_ROOT)Include/($env.MSVS_MSDK_VER)/um",
    $"($env.MSVS_MSDK_ROOT)Include/($env.MSVS_MSDK_VER)/winrt"
  ] | str join ";")
}

export def-env activate [
    --host   (-h): string = "x64",    # Host architecture, must be x64 or x86 (case insensitive)
    --target (-t): string = "x64",    # Target architecture, must be x64 or x86 (case insensitive)
    --sdk    (-s): string = "latest"  # Version of Windows SDK, must be "latest" or a valid version string
  ] {
  if (($env.MSVS_ROOT | is-empty) or ($env.MSVS_MSVC_ROOT | is-empty)) {
    echo "Either Microsoft Visual Studio or MSVC is valid."
    return
  }

  let fh = ($host | str downcase)
  let ft = ($target | str downcase)
  let fs = (
      if ($sdk != "latest") {
        $sdk
      } else {
        $env.MSVS_MSDK_VER
      })

  if (($fh != "x64") and ($fh != "x86")) {
    echo $"Wrong host architecture specified: ($fh)."
    help n_msvc activate
    return
  }

  if (($ft != "x64") and ($ft != "x86")) {
    echo $"Wrong target architecture specified: ($ft)."
    help n_msvc activate
    return
  }

  if not ($"($env.MSVS_MSDK_ROOT)bin/($fs)" | path exists) {
    echo $"Invalid Windows SDK version specified: ($fs)."
    return
  }

  let env_path = [
    $"($env.MSVS_ROOT)/../Shared/Common/VSPerfCollectionTools/vs2019",
    $"($env.MSVS_ROOT)/Common7/IDE",
    $"($env.MSVS_ROOT)/Common7/IDE/CommonExtensions/Microsoft/TestWindow",
    $"($env.MSVS_ROOT)/Common7/IDE/CommonExtensions/Microsoft/TeamFoundation/Team Explorer",
    $"($env.MSVS_ROOT)/Common7/IDE/Extensions/Microsoft/IntelliCode/CLI",
    $"($env.MSVS_ROOT)/Common7/IDE/Tools",
    $"($env.MSVS_ROOT)/Common7/IDE/VC/VCPackages",
    $"($env.MSVS_ROOT)/Common7/Tools/devinit",
    $"($env.MSVS_ROOT)/MSBuild/Current/bin",
    $"($env.MSVS_ROOT)/MSBuild/Current/bin/Roslyn",
    $"($env.MSVS_ROOT)/Team Tools/Performance Tools",
    $"($env.MSVS_MSVC_ROOT)/bin/Host($fh)/($ft)",
    $"($env.MSVS_MSDK_ROOT)bin/($ft)",
    $"($env.MSVS_MSDK_ROOT)bin/($fs)/($ft)"
  ]

  let env_path = (
      if ($ft == "x64") {
        ($env_path | prepend $"($env.MSVS_ROOT)/../Shared/Common/VSPerfCollectionTools/vs2019/x64")
      } else {
        $env_path
      })

  let env_path = (
      if ($ft == "x64") {
        ($env_path | prepend $"($env.MSVS_ROOT)/Team Tools/Performance Tools/x64")
      } else {
        $env_path
      })

  let env_path = (
      if ($ft != $fh) {
        ($env_path | prepend $"($env.MSVS_MSVC_ROOT)/bin/Host($fh)/($fh)")
      } else {
        $env_path
      })

  let env_path = ($env.MSVS_BASE_PATH | prepend $env_path)

  let lib_path = ([
    $"($env.MSVS_MSDK_ROOT)Lib/($env.MSVS_MSDK_VER)/ucrt/($ft)",
    $"($env.MSVS_MSDK_ROOT)Lib/($env.MSVS_MSDK_VER)/um/($ft)",
    $"($env.MSVS_MSVC_ROOT)/lib/($ft)",
  ] | str join ";")

  load-env {
    Path: $env_path,
    PATH: $env_path,
    INCLUDE: $env.MSVS_INCLUDE_PATH,
    LIB: $lib_path
  }
}

export def-env deactivate [] {
  if (($env.MSVS_ROOT | is-empty) or ($env.MSVS_MSVC_ROOT | is-empty)) {
    echo "Either Microsoft Visual Studio or MSVC is valid."
    return
  }

  load-env {
    Path: $env.MSVS_BASE_PATH,
    PATH: $env.MSVS_BASE_PATH
  }
}
