Area.destroy_all

Area.create!([
  { name: "Hörnle", lat: 47.665028, lng: 9.219556, algae_index: 0.2 },
  {
    name: "Schänzle",
    lat: 47.668917,
    lng: 9.159306,
    algae_index: 1,
    polygon: [
    [47.6693, 9.1589],
    [47.6695, 9.1595],
    [47.6690, 9.1601],
    [47.6688, 9.1593]
  ]
  },
  { name: "Herosé", lat: 47.668882, lng: 9.174127, algae_index: 0.0 }
])
