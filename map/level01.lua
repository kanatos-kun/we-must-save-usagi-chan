return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.17.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 18,
  tilewidth = 8,
  tileheight = 8,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "tilesheet",
      firstgid = 1,
      filename = "tilesheet.tsx",
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      image = "../image/tilesheet.png",
      imagewidth = 160,
      imageheight = 160,
      transparentcolor = "#e0f8d0",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 400,
      tiles = {
        {
          id = 0,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 1,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 2,
          properties = {
            ["type"] = "movingRight"
          }
        },
        {
          id = 3,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 4,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 5,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 6,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 7,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 8,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 9,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 22,
          properties = {
            ["type"] = "movingLeft"
          }
        },
        {
          id = 23,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 24,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 25,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 26,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 27,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 28,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 29,
          properties = {
            ["type"] = "solid"
          }
        }
      }
    }
  },
  layers = {
    {
      type = "imagelayer",
      name = "Calque d'image 1",
      visible = true,
      opacity = 1,
      offsetx = 147.545,
      offsety = -40.1818,
      image = "../image/background.png",
      properties = {}
    },
    {
      type = "tilelayer",
      name = "Calque de Tile 1",
      x = 0,
      y = 0,
      width = 30,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 147.5,
      offsety = -40,
      properties = {
        ["type"] = "solid"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 25, 25, 24, 24, 1, 1, 10, 10, 9, 9, 8, 8, 7, 7, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 30, 29, 29, 28, 28, 27, 27, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 1, 1,
        0, 0, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 1, 1, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 0, 0,
        0, 0, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        4, 4, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        24, 24, 1, 1, 10, 10, 9, 9, 8, 8, 7, 7, 6, 6, 5, 5, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 30, 30, 29, 29, 28, 28, 27, 27, 26, 26, 25, 25, 24, 24, 1, 1, 10, 10, 9, 9, 8, 8, 7, 7, 6, 6,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 30, 29, 29, 28, 28, 27, 27, 26, 26,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30
      }
    }
  }
}
