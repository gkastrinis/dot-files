from relationalai.semantics import Model, select, define, Integer, String
m = Model("...")

Person = m.Concept("Person")
Person.name = m.Property(f"{Person} has {String:name}")
Person.age = m.Property(f"{Person} has {Integer:age}")

define(
     p1 := Person.new(name="George", age=38),
)

select(Person.name).inspect()
