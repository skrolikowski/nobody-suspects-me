return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 60,
  height = 40,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 10,
  nextobjectid = 89,
  backgroundcolor = { 250, 253, 255 },
  properties = {},
  tilesets = {
    {
      name = "Tiles",
      firstgid = 1,
      filename = "Tiles.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "Tiles.png",
      imagewidth = 128,
      imageheight = 144,
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
          name = "Wall",
          tile = 4,
          properties = {}
        }
      },
      tilecount = 72,
      tiles = {
        {
          id = 4,
          terrain = { -1, -1, -1, 0 }
        },
        {
          id = 5,
          terrain = { -1, -1, 0, 0 }
        },
        {
          id = 6,
          terrain = { -1, -1, 0, -1 }
        },
        {
          id = 12,
          terrain = { -1, 0, -1, 0 }
        },
        {
          id = 13,
          terrain = { 0, 0, 0, 0 }
        },
        {
          id = 14,
          terrain = { 0, -1, 0, -1 }
        },
        {
          id = 20,
          terrain = { -1, 0, -1, -1 }
        },
        {
          id = 21,
          terrain = { 0, 0, -1, -1 }
        },
        {
          id = 22,
          terrain = { 0, -1, -1, -1 }
        },
        {
          id = 24,
          terrain = { 0, 0, 0, -1 }
        },
        {
          id = 25,
          terrain = { 0, 0, -1, -1 }
        },
        {
          id = 26,
          terrain = { 0, 0, -1, 0 }
        },
        {
          id = 32,
          terrain = { 0, -1, 0, -1 }
        },
        {
          id = 34,
          terrain = { -1, 0, -1, 0 }
        },
        {
          id = 40,
          terrain = { 0, -1, 0, 0 }
        },
        {
          id = 41,
          terrain = { -1, -1, 0, 0 }
        },
        {
          id = 42,
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
      width = 60,
      height = 40,
      id = 6,
      name = "Floor",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eAHtlNEKgCAMRf0po/7/x3IPgxWITUScnQdJbOa9uydzSikztu/BVTLWYfM+ynpr2Pooc/UqT6u55fV81du9K897/IrXqH5V+1f93vrVsvbq99bj93lPzO6H5tW6n+x73TNb64jzRLv14pmPOH/2Nzz+tDZyvt7+qld5evdGrMfv3jmTL/lGvJdqmv/Gc60PrO/9X5Mv+cIADMAADMAADMAADMAADMAADMAADMAADIxk4AYxGfHl"
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 40,
      id = 4,
      name = "Walls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eAHlmMGu5UQMRN9mYAWsADGsRrMC/v//6JLmjEpH7U5yZ94GrhS147jLLrftRPfD29vbD/+T68fF86d1/bGu39b18cv651p/Xpf1PM/KlX07+34eGy5joM/ae5DBTjxPrsQORtbg/LKu8M3av+iCbX3btPzUvvdeyZ+XwROe2Dp2eLK2X3x4T9u0/J58wYbH3fVTB7jkcAqfHV98eI8gvt4+zc/XjTcEYqG3qP/UKDK90OvvwoZnVvMi/r/Ws7/XxTyLnCt93z9iMs6HZcTerI2FHkyeT9h3a63jarn5Ggu+U+2YF/bWk4cJZ6d3LGBY31zuyCe+vy6AU724VuDrmNAzK6m3npuuSWPD17m8w7FtEkviC973wMpZme/3iBWM9BY94Jqnb0798s+X+ILnOJfq0Y9zdN6I1fon4GB07RtvZ9P2yJzve/Gd8vCEb3qLmqfHpppnhne/IPf3BrVCPfTa83OaofBy3tD7PFx/+Au+a/VObjhf++m9seF8Oe+7q3HxN/G1HvudP9t2zJNMXk97Y5Pn8U0d9PxsmTriW9a4zHPXGXHs8tM+4wts265Hl7/JT2/s873rg3Mx38ZteYoD3ztbY1P79BIzutfM3tQKfbnriz7f9+I75Se+7fNku6v7K53z9gpfzstYfU4tw8Hc8N22YNsWjP5m6XnN/GWd+iI4iZu1faeGMjM9K/FtvtSc7U8cjAH2xNf6jrflEw58jXXakzqaYrX+xPepT9s3x5Ynn9HD13HC1/ppDk/2+DZO7He65NK8wLa+ObY8+XyFb+O2jA/HRKw7brYFw7aT/qqHdjjRJSb7Jk7rm2PLxGT7CeeJzwlj8jnpgzPxZY9z1BxbJibbn/RTboxx1UPGmezDCb72QZz9/ub93t/TfPfyvrdvcHb4d207ry1zJsZpm5abr/cQ59U73c/Ni5h2euvwaX3H3DLYjr1tWj7xTU3w/cz7u9/3fE/zjud++n42h3BznE/jf5qf2CcO1iVuf+A6vq2xlHBIX9AHWfmvoc3x49xcffu459pP9yA+4+fEhZgdR8c6yXBw3T95z4LhGIlrhz3pOF9jdfzgvsKXWUlvUPe5n2rfseDfenoO7KzI9Fnr0pfwdb0xd6m93Xnwvk/NUEP+fl6Pbv8mXuhfyXc7Dw58p/NvvfNLnZ1s2t+VDJ55TforPD8PDnyZvdTbrh5cf9RqbJnhzol9nu6nc5z0J6zdsz7fb4kz2FNM1Dz13vMSHSvfLHfPl7nd/dSye+s9+Dpv5KFr/ko2xlTPV9jGab7O6a4eTroppp6h0+xkhrK6b+DlGI0N/tRb3b/Oxa4OU3fUCyu6qRZPObr7bOI77Z9yfzpf9lzVnp87b1NMT/TwvYs92Z/O91W+rrknvCbbKf7JntgdS58v3xup01zUp8/v6t44zF5wuacPuKc/2g6ZWBqbfY0DRtujyxp9crDre2bHf23NLPwX6xNiUQ=="
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "Bounds",
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
          x = 0,
          y = 0,
          width = 960,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 608,
          width = 960,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 928,
          y = 32,
          width = 32,
          height = 576,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 32,
          width = 32,
          height = 576,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 32,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 80,
          width = 144,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 176,
          width = 192,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 224,
          width = 48,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 736,
          y = 512,
          width = 144,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 736,
          y = 416,
          width = 192,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 784,
          y = 128,
          width = 144,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 128,
          width = 96,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 80,
          width = 224,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 416,
          width = 80,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 176,
          width = 80,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 224,
          width = 240,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 512,
          width = 224,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 464,
          width = 96,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 464,
          width = 144,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 368,
          width = 240,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 32,
          width = 48,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 272,
          width = 48,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 272,
          width = 48,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 272,
          width = 48,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 272,
          width = 48,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 736,
          y = 320,
          width = 48,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 80,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 512,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 128,
          width = 48,
          height = 336,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 176,
          width = 48,
          height = 336,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 416,
          width = 48,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 560,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 784,
          y = 176,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 416,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 560,
          width = 240,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 224,
          width = 32,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 32,
          width = 240,
          height = 48,
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
          id = 57,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 32,
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
      id = 9,
      name = "Red",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 88,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 48,
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
      id = 8,
      name = "Bottle",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 58,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 75,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 82,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 83,
          name = "",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 84,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 85,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 86,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 87,
          name = "",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 32,
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
      id = 5,
      name = "Exit",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 32,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
