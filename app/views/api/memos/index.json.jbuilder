# メモの情報は複数で配列のデータになります。
# 配列を回してデータを返したい場合は array! メソッドを利用します。
# json.array! インスタンス変数, :キー
json.array! @memos, :title, :desctiption