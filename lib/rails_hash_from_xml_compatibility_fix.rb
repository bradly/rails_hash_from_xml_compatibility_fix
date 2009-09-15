module RailsHashFromXmlCompatibilityFix
   Hash.class_eval do
     def self.unrename_keys(params)
       case params.class.to_s
         when "Hash"
           params.inject({}) do |h,(k,v)|
             h[k.to_s.underscore.tr("-", "_")] = unrename_keys(v)
             h
           end
         when "Array"
           params.map { |v| unrename_keys(v) }
         else
           params
         end
     end
   end
end
