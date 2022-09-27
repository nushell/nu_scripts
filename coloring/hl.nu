export def combine [txt: string, fg: record, bg: record] {
  {
    txt: $txt,
    fg:  $fg.fg,
    bg:  $bg.fg,
    bli: ($fg.bli || $bg.bli),
    bol: ($fg.bol || $bg.bol),
    dim: ($fg.dim || $bg.dim),
    hid: ($fg.hid || $bg.hid),
    ita: ($fg.ita || $bg.ita),
    rev: ($fg.rev || $bg.rev),
    stk: ($fg.stk || $bg.stk),
    und: ($fg.und || $bg.und)
  }
}

export def create [txt: string,
    fg = "n", bg = "n",
    bli = false, bol = false, dim = false, hid = false,
    ita = false, rev = false, stk = false, und = false] {
  {
    txt: $txt,
    fg:  $fg,
    bg:  $bg,
    bli: $bli,
    bol: $bol,
    dim: $dim,
    hid: $hid,
    ita: $ita,
    rev: $rev,
    stk: $stk,
    und: $und
  }
}

export def render [obj: record] {
  let attr = ""
  let attr = $"($attr)(if $obj.bli {'l'})"
  let attr = $"($attr)(if $obj.bol {'b'})"
  let attr = $"($attr)(if $obj.dim {'d'})"
  let attr = $"($attr)(if $obj.hid {'h'})"
  let attr = $"($attr)(if $obj.ita {'i'})"
  let attr = $"($attr)(if $obj.rev {'r'})"
  let attr = $"($attr)(if $obj.stk {'s'})"
  let attr = $"($attr)(if $obj.und {'u'})"

  let color = {fg: $obj.fg, bg: $obj.bg, attr: $attr}

  $"(ansi $color)($obj.txt)(ansi reset)"
}

export def reverse [obj: record] {
  let r = ($obj | update fg $obj.bg)
  let r = ($r | update bg $obj.fg)
  $r
}
