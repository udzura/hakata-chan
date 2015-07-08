# -*- coding: utf-8 -*-
module Lita
  module Handlers
    class Omikujijp < Handler
      route /くじ[引び]き[ 　]+([0-9０-９]+)から([0-9０-９]+)の間から([0-9０-９]+)個/, :draw, help: {
        "くじ引き XXからYYの間からZZ個" => "XX ~ YY の間の数から ZZ 個数字を引きます。博多弁で"
      }
      def draw(response)
        from, to, count = *response.matches[0][0..2].map{|v| v.tr('０-９', '0-9').to_i }
        sample = (from..to).to_a.sample(count)
        response.reply "ヒキヨッタバイ: %s" % sample.sort.join(", ")
      rescue => e
        response.reply "シッパイデスタイ: %s: %s" % [e.class, e.message]
      end
    end

    Lita.register_handler(Omikujijp)
  end
end
