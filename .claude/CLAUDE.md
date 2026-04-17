# グローバル指示

- 認証が必要なサイト（Notion team-b 等）や JavaScript レンダリングが必要な動的ページにアクセスする場合、agent-browser CLI を第一候補として使うこと。うまくいかない場合のみ browser-use CLI（`uvx browser-use`）にフォールバック。公開された静的ドキュメントや API リファレンスは WebFetch / WebSearch で十分
- mainブランチをマージする際は、ローカルのmainをpullしてから `git merge --no-ff main` を使うこと（`origin/main` を直接マージしない）

## GitHub Issue作成

- GitHub Copilot用のIssueを作成する際は、概要セクションの先頭にNotionチケットへのリンクを入れること
- Notionチケットのサイドパネル（隠しプロパティ）にある `url-md` の値をそのまま使う（例: `Notionチケット: [TASK-XXXX｜タイトル](URL)`）

## コンテキスト管理

- 次のいずれかに該当する調査はサブエージェントに委譲し、メインコンテキストを汚さないこと: (1) 3ファイル以上を横断する探索、(2) 大量コードの読み込みが想定される調査、(3) 検索ワードを試行錯誤しながら探すタイプの open-ended な調査
- 無関係なタスクに切り替える際は `/clear` を推奨
- compaction時は変更ファイル一覧とテストコマンドを保持すること
