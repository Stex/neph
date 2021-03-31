module Neph
  module Refinements
    module Hash
      refine ::Hash do
        def symbolize_keys
          each_with_object({}) do |(key, value), options|
            options[begin
              key.to_sym
            rescue
              key
            end || key] = value
          end
        end

        def symbolize_keys!
          replace(symbolize_keys)
        end
      end
    end
  end
end
