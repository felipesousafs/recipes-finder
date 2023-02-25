require "active_support/core_ext/module/delegation"
require "active_support/deprecation"

module PgSearch
  module Features
    class TSearch < Feature

      def ts_query_consecutive(term)
        "(#{term.split('<->').map { |_term| construct_ts_query(_term) }.join(' <-> ')})"
        # "(#{term.split('<->').map { |_term| construct_ts_query(_term) }.join(' && ')})"
      end

      def construct_ts_query(term)
        if term.include?('<->')
          ts_query_consecutive(term)
        else
          tsquery_for_term(term)
        end
      end

      def tsquery
        return "''" if query.blank?
        query_terms = query.split.compact
        tsquery_terms = query_terms.map { |term| construct_ts_query(term) }
        tsquery_terms.join(options[:any_word] ? ' || ' : ' && ')
      end
    end
  end
end
