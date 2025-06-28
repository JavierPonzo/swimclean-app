Area.destroy_all

Area.create!([
  { name: "Hörnle", lat: 47.665028, lng: 9.219556, algae_index: 0.2 },
  {
    name: "Schänzle",
    lat: 47.668917,
    lng: 9.159306,
    algae_index: 1,
    polygon: [
      [47.6691, 9.1590],
      [47.6693, 9.1597],
      [47.6686, 9.1600],
      [47.6685, 9.1592]
    ]
  },
  { name: "Herosé", lat: 47.668882, lng: 9.174127, algae_index: 0.0 }
  {
    name: "Strandbad Horn",
    lat: 47.6667572,
    lng: 9.2148792,
    algae_index: 0.0
  },
  {
    name: "Strandbad Litzelstetten",
    lat: 47.71973,
    lng: 9.177678,
    algae_index: 0.0
  },
  {
    name: "Rheinstrandbad",
    lat: 47.6735,
    lng: 9.1702,
    algae_index: 0.0
  }
])
