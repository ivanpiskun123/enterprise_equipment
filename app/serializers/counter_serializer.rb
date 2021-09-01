class CounterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :value, :id
end
