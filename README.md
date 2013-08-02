# バルス
node.jsでバルスな連投をしましょう。

## install
node.jsとnpmがbashなどのコンソールから動くようにしておく。
consumer_keyやaccess_tokenをconfig.jsonにセットしておいてください。

	$ npm install
	$ cp config_example.json config.json
	$ vim config.json // ここでconsumer_keyとaccess_tokenを設定しておく。
	$ npm start //ここで爆撃されるので、注意

ソースはcoffeeScriptで書かれていますので、src/app.coffeeを書き換えてください。
一番上に投稿する回数などが定義されています。
coffeeScriptに関して、特に設定などは必要ありません。