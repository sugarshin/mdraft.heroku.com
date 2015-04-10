Notes = require 'collection/notes'
AppView = require 'view/appview'
NoteListView = require 'view/notelistview'
NoteBody = require 'view/notebody'
NewButton = require 'view/newbutton'
DeleteButton = require 'view/deletebutton'
CopyButton = require 'view/copybutton'
Markdown = require 'view/markdown'
AllCheck = require 'view/allcheck'

appView = new AppView

notes = new Notes

noteListView = new NoteListView
  el: '.noteList'
  collection: notes

newButton = new NewButton
  el: '#new'
  collection: notes

allCheck = new AllCheck
  el: '#check-all'
  collection: notes

deleteButton = new DeleteButton
  el: '#delete'
  collection: notes

copyButton = new CopyButton
  el: '#copy-button'
  collection: notes

notes.fetch()

noteBody = new NoteBody
  collection: notes



md = new Markdown(
  document.getElementById 'preview'
  document.getElementById 'textarea'
)

md.toHTML().start()



notes.each (model) ->
  model.set 'checked', false
  model.set 'active', false



unless localStorage.getItem 'mdraftInitialize'
  body = '''
## 見出し

### 見出し

#### 見出し

テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト

[リンク](//tsumikiinc.github.io/mdraft/public/)


> blockquote blockquote blockquote blockquote

**strong**

*Italic*

`inline code`

    code block

![画像](//blog.tsumikiinc.com/img/logo.png)

リスト

* list
* list
* list

オーダーリスト

1. Order list
2. Order list
3. Order list

<table>
  <thead>
    <tr><th>テーブル</th><th>テーブル</th></tr>
  </thead>
  <tbody>
    <tr><th>テーブル</th><th>テーブル</th></tr>
    <tr><td>テーブル</td><td>テーブル</td></tr>
    <tr><td>テーブル</td><td>テーブル</td></tr>
  </tbody>
</table>
  '''

  notes.add
    title: 'サンプル'
    body: body

  localStorage.setItem 'mdraftInitialize', true



unless localStorage.getItem 'mdraftTopic1'
  body = '''
## HTML 記法をサポートしました

11/23

<p>HTML タグを書いてプレビュー可能です</p>

<dl>
  <dt>標準のマークダウン記法だけでは</dt>
  <dt>コンパイルできないタグなどに</dt>
</dl>

<p>MTのマークダウンでもすでにサポートされているのでそのままコピペしていただいて大丈夫です</p>
  '''
  notes.add
    title: '更新情報 11/23'
    body: body
    created: '2014/11/23 00:00'

  localStorage.setItem 'mdraftTopic1', true
