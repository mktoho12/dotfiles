# グローバル指示

- Webページを参照する必要がある場合、agent-browser CLIを第一候補として使うこと。うまくいかない場合のみ browser-use CLI（`uvx browser-use`）にフォールバック
- mainブランチをマージする際は、ローカルのmainをpullしてから `git merge --no-ff main` を使うこと（`origin/main` を直接マージしない）

## GitHub Issue作成

- GitHub Copilot用のIssueを作成する際は、概要セクションの先頭にNotionチケットへのリンクを入れること
- Notionチケットのサイドパネル（隠しプロパティ）にある `url-md` の値をそのまま使う（例: `Notionチケット: [TASK-XXXX｜タイトル](URL)`）

## コンテキスト管理

- 大きな調査タスクはサブエージェントに委譲し、メインコンテキストを汚さないこと
- 無関係なタスクに切り替える際は `/clear` を推奨
- compaction時は変更ファイル一覧とテストコマンドを保持すること
