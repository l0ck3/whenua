require 'couchbase'

module Whenua
  module Couchbase
    class DataStore

      def initialize(params)
        @host   = params[:host]
        @port   = params[:port]
        @bucket = params[:bucket]
      end

      def client
        @client ||= ::Couchbase.new(
          host: @host,
          port: @port,
          bucket: @bucket
        )
      end

      def delete(key)
        client.delete(key)
      end

      def fetch(index, document, params={})
        default_params = { limit: 100 }
        begin
          # TODO : Inverse the behavior and make the in-memory data store return Row objects
          rows = client.design_docs[document.to_s].send(index.to_s, default_params.merge(params)).fetch
          rows.map do |row|
            {
              id: row.id,
              value: row.value,
              key: row.key,
              doc: row.doc,
              meta: row.meta
            }
          end
        rescue NoMethodError
          raise IndexMissingError
        end
      end

      def get(key)
        client.get(key)
      end

      def save(data)
        key      = data[:key]
        document = data[:value]

        if key.nil?
          key = _generate_id
          client.add(key, document)
        else
          client.replace(key, document)
        end

        key
      end

    private

      def _generate_id
        SecureRandom.uuid
      end

    end
  end
end
