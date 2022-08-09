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
```javascript
const a = [1,2,3]
const b = {"x": 1, "y": 2}
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

- Tree climber
```lua
keymap(nvo, "gtk", treeclimber.goto_parent, opts)
keymap(nvo, "gtj", treeclimber.goto_child, opts)
keymap(nvo, "<c-n>", treeclimber.goto_next, opts)
keymap(nvo, "<c-p>", treeclimber.goto_prev, opts)
keymap(vo, "n", treeclimber.select_node, opts)
keymap("n", "<c-k>", treeclimber.swap_prev, opts)
keymap("n", "<c-j>", treeclimber.swap_next, opts)
```

- Fugitive
`:0G` - open git status in fullscreen
`-`/`a` - [un]stage file (press it in "[Un]staged to toggle all file")
`=` - open details (diff)
`dv` - open vertical diff split
`cc` - Create a commit
`ca` - Amend the last commit and edit the message
`ce` - Amend the last commit without editing the message
`cw` - Reword the last commit

- Fugitive merge conflict
- `Gvdiffsplit!`

- Telescope
use .fdignore to negate files in .gitignore but still searchable via telescope

- Misc
-- Paste word to cmdline
yank text (default to '+' register)
do cmd operation:
  `:'<,'>s/`
press `<C-R>+` to paste contents of register to cmdline

- leap
Operator-pending mode
In Operator-pending mode, there are two different (pairs of) default motions available, providing the necessary additional comfort and precision, since in that case we are targeting exact positions, and can only aim once, without the means of easy correction.

z/Z are the equivalents of Normal/Visual s/S, and they follow the semantics of / and ? in terms of cursor placement and inclusive/exclusive operational behaviour, including forced motion types (:h forced-motion).

x/X provide missing variants for the two directions; the mnemonics could be extend/eXclude:

ab···|                    |···ab
█████·  ←  Zab    zab  →  ████ab
ab███·  ←  Xab    xab  →  ██████
As you can see from the figure, x goes to the end of the match, including it in the operation, while X stops just before - in an absolute sense, after - the end of the match (the equivalent of T for Leap motions). In simpler terms: x/X both shift the relevant edge of the operated area by +2.

