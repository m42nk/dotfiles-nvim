Remember "hidden" useful keymaps

- Treesitter
```
if,af to select inner/outer function
```

- Autopairs
```
fastwrap using <M-e>
```

- Targets.vim
```
cin<pair> to change inner of next found pair

ci<separator(, = * etc)

caa - change around args
cina - change inner next argument
cila - change inner previous argument
```

- Surround
```
use <c-j> instead of <Return>
to surround with newline
```

- Splitjoin.vim
The idea of this plugin is to introduce a single key binding (default: gS) for transforming a line like this:
```html
<div id="foo">bar</div>
```

```html
<div id="foo">
  bar
</div>
```
gJ to return

- Fugitive
`:0G` - open git status in fullscreen
`-`/`a` - [un]stage file
`=` - open details (diff)
`dv` - open vertical diff split
`cc` - Create a commit
`ca` - Amend the last commit and edit the message
`ce` - Amend the last commit without editing the message
`cw` - Reword the last commit
