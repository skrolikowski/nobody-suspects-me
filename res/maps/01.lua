return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 35,
  height = 22,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 10,
  nextobjectid = 23,
  properties = {},
  tilesets = {
    {
      name = "Tileset",
      firstgid = 1,
      filename = "Tileset.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "Tileset.png",
      imagewidth = 128,
      imageheight = 64,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {
        {
          name = "Walls",
          tile = 0,
          properties = {}
        }
      },
      tilecount = 32,
      tiles = {
        {
          id = 0,
          terrain = { -1, -1, -1, 0 }
        },
        {
          id = 1,
          terrain = { -1, -1, 0, 0 }
        },
        {
          id = 2,
          terrain = { -1, -1, 0, -1 }
        },
        {
          id = 3,
          terrain = { 0, 0, 0, -1 }
        },
        {
          id = 4,
          terrain = { 0, 0, -1, -1 }
        },
        {
          id = 5,
          terrain = { 0, 0, -1, 0 }
        },
        {
          id = 8,
          terrain = { -1, 0, -1, 0 }
        },
        {
          id = 9,
          terrain = { 0, 0, 0, 0 }
        },
        {
          id = 10,
          terrain = { 0, -1, 0, -1 }
        },
        {
          id = 11,
          terrain = { 0, -1, 0, -1 }
        },
        {
          id = 13,
          terrain = { -1, 0, -1, 0 }
        },
        {
          id = 16,
          terrain = { -1, 0, -1, -1 }
        },
        {
          id = 17,
          terrain = { 0, 0, -1, -1 }
        },
        {
          id = 18,
          terrain = { 0, -1, -1, -1 }
        },
        {
          id = 19,
          terrain = { 0, -1, 0, 0 }
        },
        {
          id = 20,
          terrain = { -1, -1, 0, 0 }
        },
        {
          id = 21,
          terrain = { -1, 0, 0, 0 }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 35,
      height = 22,
      id = 1,
      name = "Floor",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzjZWBg4B3Fo3gU0xzLoGFqqR11y6hb6O0WYrAsjd0iSyJN63Ah1T2DIY5oFS6jeBSP4qGDAaHqLQQ="
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 35,
      height = 22,
      id = 3,
      name = "Decorations",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJztjrEKACAIRN0c7f+/toYEh0SodKh7cHDDKY8IAFABj7QZDrZitpLgog7qFG3FOL3swk5fIU6/RXP66faGS5Qql4q7jJ9ZLrsBAPxLB+ujA5E="
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 35,
      height = 22,
      id = 2,
      name = "Walls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJztlN0KgCAMhZdlEIXQj77/ozZJSWS7SIcX4YEPIQ6Ho2wBdHXJaEAsogI2OUfCqxh/7i2RQSbkyJiRNfMuwasTOG+JfP7GfKe6UF4j1IXL4bpQXskute/CdZTscsEzm3E+XYMuVM4O7xzr5Dw/ZHyVxJ2k3oWbgdYZMaf2TtzMlXSpzZHcab8visAC/c/PcUJd0n2pgdqvrq4/6QZqWwZL"
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
      name = "Bounds",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 64,
          width = 32,
          height = 208,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 64,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 64,
          width = 112,
          height = 112,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 64,
          width = 32,
          height = 208,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 240,
          width = 240,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 64,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "Bottle",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "Blue",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "Exit",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 112,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "Pink",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
