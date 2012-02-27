((g) ->
  ms = (s) ->
    return Number(s)  if s is Number(s)
    r.exec s.toLowerCase()
    RegExp.$1 * _[RegExp.$2]
  r = /(\d*.?\d+)([mshd]+)/
  _ = {}
  _.ms = 1
  _.s = 1000
  _.m = _.s * 60
  _.h = _.m * 60
  _.d = _.h * 24
  (if g.top then g.ms = ms else module.exports = ms)
) this