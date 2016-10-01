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
  nextobjectid = 40,
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
          id = 10,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 11,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 12,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 13,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 14,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 15,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 16,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 20,
          properties = {
            ["type"] = "climb"
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
        },
        {
          id = 30,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 31,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 32,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 33,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 34,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 35,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 36,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 50,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 51,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 52,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 53,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 54,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 55,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 56,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 70,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 71,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 72,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 73,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 74,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 75,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 76,
          properties = {
            ["type"] = "climb"
          }
        },
        {
          id = 90,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 91,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 92,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 93,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 94,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 95,
          properties = {
            ["type"] = "solid"
          }
        },
        {
          id = 96,
          properties = {
            ["type"] = "solid"
          }
        }
      }
    },
    {
      name = "player",
      firstgid = 401,
      tilewidth = 8,
      tileheight = 12,
      spacing = 0,
      margin = 0,
      image = "../image/player.png",
      imagewidth = 8,
      imageheight = 12,
      transparentcolor = "#e0f8d0",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
    },
    {
      name = "tonneau",
      firstgid = 402,
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      image = "../image/tonneau.png",
      imagewidth = 8,
      imageheight = 8,
      transparentcolor = "#e0f8d0",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
    },
    {
      name = "snake",
      firstgid = 403,
      tilewidth = 16,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      image = "../image/snake.png",
      imagewidth = 16,
      imageheight = 8,
      transparentcolor = "#e0f8d0",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
    },
    {
      name = "mao_snake",
      firstgid = 404,
      tilewidth = 24,
      tileheight = 24,
      spacing = 0,
      margin = 0,
      image = "../image/mao_snake.png",
      imagewidth = 24,
      imageheight = 24,
      transparentcolor = "#e0f8d0",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
    },
    {
      name = "princesse",
      firstgid = 405,
      tilewidth = 8,
      tileheight = 13,
      spacing = 0,
      margin = 0,
      image = "../image/princesse.png",
      imagewidth = 8,
      imageheight = 13,
      transparentcolor = "#e0f8d0",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
    },
    {
      name = "tonneau_02",
      firstgid = 406,
      tilewidth = 8,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "../image/tonneau_02.png",
      imagewidth = 8,
      imageheight = 16,
      transparentcolor = "#e0f8d0",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
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
      offsetx = 147.833,
      offsety = -39.6667,
      properties = {
        ["type"] = "solid"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 1, 1, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 17, 10, 9, 9, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 30, 29, 29, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57, 0, 0, 0, 4, 4, 5, 5, 6, 6,
        0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 77, 10, 1, 1, 24, 24, 25, 25, 26, 26,
        0, 0, 9, 9, 10, 17, 1, 1, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 29, 29, 30, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        4, 4, 0, 0, 0, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        24, 24, 1, 1, 10, 77, 9, 9, 8, 8, 7, 7, 6, 6, 5, 5, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 30, 30, 29, 29, 28, 28, 27, 27, 26, 26, 25, 25, 24, 24, 1, 1, 10, 10, 9, 9, 15, 8, 7, 7, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 30, 29, 29, 35, 28, 27, 27, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 5, 5, 6, 6, 7, 7, 75, 8, 9, 9, 10, 10,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30
      }
    },
    {
      type = "objectgroup",
      name = "Ennemy",
      visible = true,
      opacity = 1,
      offsetx = 147.651,
      offsety = -40.1364,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "player",
          type = "player",
          shape = "rectangle",
          x = 87.841,
          y = 135.727,
          width = 8,
          height = 12,
          rotation = 0,
          gid = 401,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "tonneau",
          type = "baril",
          shape = "rectangle",
          x = 151.099,
          y = 38.1364,
          width = 8,
          height = 8,
          rotation = 0,
          gid = 402,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "sensor",
      visible = true,
      opacity = 1,
      offsetx = 147.25,
      offsety = -40.6364,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 8,
          name = "LeftSensor",
          type = "leftSensor",
          shape = "rectangle",
          x = 215.773,
          y = 40.5455,
          width = 24.9091,
          height = 23.0909,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "RightSensor",
          type = "rightSensor",
          shape = "rectangle",
          x = -0.590909,
          y = 80.9091,
          width = 17.2727,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "LeftSensor",
          type = "leftSensor",
          shape = "rectangle",
          x = 221.773,
          y = 112,
          width = 18.9091,
          height = 19.2727,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "barilSpawner",
          type = "barilSpawner",
          shape = "rectangle",
          x = 60,
          y = 21.1364,
          width = 8.25,
          height = 8.25,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "remove",
          type = "remove",
          shape = "rectangle",
          x = 0.25,
          y = 127.886,
          width = 6.5,
          height = 8.75,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "pass",
          type = "pass",
          shape = "rectangle",
          x = 111.75,
          y = 6.6364,
          width = 8.25,
          height = 9,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "object",
      visible = false,
      opacity = 1,
      offsetx = 147.833,
      offsety = -40.9167,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 23,
          name = "tonneau_02",
          type = "",
          shape = "rectangle",
          x = 17.5,
          y = 24.2917,
          width = 8,
          height = 16,
          rotation = 0,
          gid = 406,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "tonneau_02",
          type = "",
          shape = "rectangle",
          x = 13.5,
          y = 11.7917,
          width = 8,
          height = 16,
          rotation = 0,
          gid = 406,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "tonneau_02",
          type = "",
          shape = "rectangle",
          x = 9.75,
          y = 24.5417,
          width = 8,
          height = 16,
          rotation = 0,
          gid = 406,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "tonneau_02",
          type = "",
          shape = "rectangle",
          x = 25.75,
          y = 24.0417,
          width = 8,
          height = 16,
          rotation = 0,
          gid = 406,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "tonneau_02",
          type = "",
          shape = "rectangle",
          x = 22.5,
          y = 12.2917,
          width = 8,
          height = 16,
          rotation = 0,
          gid = 406,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "Mao_snake",
          type = "maoSnake",
          shape = "rectangle",
          x = 38.5833,
          y = 15.9167,
          width = 24,
          height = 24,
          rotation = 0,
          gid = 404,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "Princess",
          type = "",
          shape = "rectangle",
          x = 104.182,
          y = 11.4735,
          width = 8,
          height = 13,
          rotation = 0,
          gid = 405,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
