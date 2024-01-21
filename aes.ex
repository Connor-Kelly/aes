import Bitwise

defmodule AES do
  def subChar(char) do
    sbox = [
      [
        0x63,
        0x7C,
        0x77,
        0x7B,
        0xF2,
        0x6B,
        0x6F,
        0xC5,
        0x30,
        0x01,
        0x67,
        0x2B,
        0xFE,
        0xD7,
        0xAB,
        0x76
      ],
      [
        0xCA,
        0x82,
        0xC9,
        0x7D,
        0xFA,
        0x59,
        0x47,
        0xF0,
        0xAD,
        0xD4,
        0xA2,
        0xAF,
        0x9C,
        0xA4,
        0x72,
        0xC0
      ],
      [
        0xB7,
        0xFD,
        0x93,
        0x26,
        0x36,
        0x3F,
        0xF7,
        0xCC,
        0x34,
        0xA5,
        0xE5,
        0xF1,
        0x71,
        0xD8,
        0x31,
        0x15
      ],
      [
        0x04,
        0xC7,
        0x23,
        0xC3,
        0x18,
        0x96,
        0x05,
        0x9A,
        0x07,
        0x12,
        0x80,
        0xE2,
        0xEB,
        0x27,
        0xB2,
        0x75
      ],
      [
        0x09,
        0x83,
        0x2C,
        0x1A,
        0x1B,
        0x6E,
        0x5A,
        0xA0,
        0x52,
        0x3B,
        0xD6,
        0xB3,
        0x29,
        0xE3,
        0x2F,
        0x84
      ],
      [
        0x53,
        0xD1,
        0x00,
        0xED,
        0x20,
        0xFC,
        0xB1,
        0x5B,
        0x6A,
        0xCB,
        0xBE,
        0x39,
        0x4A,
        0x4C,
        0x58,
        0xCF
      ],
      [
        0xD0,
        0xEF,
        0xAA,
        0xFB,
        0x43,
        0x4D,
        0x33,
        0x85,
        0x45,
        0xF9,
        0x02,
        0x7F,
        0x50,
        0x3C,
        0x9F,
        0xA8
      ],
      [
        0x51,
        0xA3,
        0x40,
        0x8F,
        0x92,
        0x9D,
        0x38,
        0xF5,
        0xBC,
        0xB6,
        0xDA,
        0x21,
        0x10,
        0xFF,
        0xF3,
        0xD2
      ],
      [
        0xCD,
        0x0C,
        0x13,
        0xEC,
        0x5F,
        0x97,
        0x44,
        0x17,
        0xC4,
        0xA7,
        0x7E,
        0x3D,
        0x64,
        0x5D,
        0x19,
        0x73
      ],
      [
        0x60,
        0x81,
        0x4F,
        0xDC,
        0x22,
        0x2A,
        0x90,
        0x88,
        0x46,
        0xEE,
        0xB8,
        0x14,
        0xDE,
        0x5E,
        0x0B,
        0xDB
      ],
      [
        0xE0,
        0x32,
        0x3A,
        0x0A,
        0x49,
        0x06,
        0x24,
        0x5C,
        0xC2,
        0xD3,
        0xAC,
        0x62,
        0x91,
        0x95,
        0xE4,
        0x79
      ],
      [
        0xE7,
        0xC8,
        0x37,
        0x6D,
        0x8D,
        0xD5,
        0x4E,
        0xA9,
        0x6C,
        0x56,
        0xF4,
        0xEA,
        0x65,
        0x7A,
        0xAE,
        0x08
      ],
      [
        0xBA,
        0x78,
        0x25,
        0x2E,
        0x1C,
        0xA6,
        0xB4,
        0xC6,
        0xE8,
        0xDD,
        0x74,
        0x1F,
        0x4B,
        0xBD,
        0x8B,
        0x8A
      ],
      [
        0x70,
        0x3E,
        0xB5,
        0x66,
        0x48,
        0x03,
        0xF6,
        0x0E,
        0x61,
        0x35,
        0x57,
        0xB9,
        0x86,
        0xC1,
        0x1D,
        0x9E
      ],
      [
        0xE1,
        0xF8,
        0x98,
        0x11,
        0x69,
        0xD9,
        0x8E,
        0x94,
        0x9B,
        0x1E,
        0x87,
        0xE9,
        0xCE,
        0x55,
        0x28,
        0xDF
      ],
      [
        0x8C,
        0xA1,
        0x89,
        0x0D,
        0xBF,
        0xE6,
        0x42,
        0x68,
        0x41,
        0x99,
        0x2D,
        0x0F,
        0xB0,
        0x54,
        0xBB,
        0x16
      ]
    ]

    col = char |> band(0x0F)
    row = char |> band(0xF0) |> bsr(4)

    # [row: row, col: col] |> IO.inspect()
    sbox |> Enum.at(row) |> Enum.at(col)
    # let binString = parseInt(byte, 16).toString(2).padStart(8, '0');
    # let row = binString.substring(0, 4);
    # let col = binString.substring(4);
    # let r = parseInt(row, 2).toString();
    # let c = parseInt(col, 2).toString();
    # // console.log(`binString: ${binString}, row: ${r}, col: ${c}`);
    # // console.log(sbox[r][c])
    # return sbox[r][c];
  end

  def subWord(word) do
    word |> Enum.map(fn char -> char |> Integer.parse(16) |> elem(0) |> AES.subChar() end)
  end

  def rcon(i) do
    [AES.getRoundKey(i), 0x0, 0, 0]
    |> Enum.map(fn c -> c end)
  end

  def rotWord(w) do
    tl(w) ++ [hd(w)]
  end

  def getRoundKey(i) do
    cond do
      i == 1 ->
        1

      i >= 1 ->
        lastRc = AES.getRoundKey(i - 1)

        cond do
          lastRc < 0x80 ->
            2 * lastRc

          lastRc >= 0x80 ->
            Bitwise.bxor(2 * lastRc, 0x11B)
        end
    end
  end

  def generateWordChunks(key, i) when i < 0 do
    []
  end

  def generateWordChunks(key, i) when i <= 3 do
    wCur = key |> Enum.at(i)
    AES.generateWordChunks(key, i - 1) ++ [wCur]
  end

  def generateWordChunks(key, i) when i > 3 do
    w = generateWordChunks(key, i - 1)

    # [w: w] |> IO.inspect()
    temp = w |> Enum.at(i - 1)

    temp =
      if Integer.mod(i, 4) == 0 do
        temp = temp |> AES.rotWord() |> AES.subWord()

        temp =
          Enum.zip(temp, rcon(floor(i / 4)))
          |> Enum.map(fn pair ->
            first = pair |> elem(0)
            second = pair |> elem(1)

            # [f: first, s: second] |> Enum.map(fn i -> {elem(i, 0), Integer.to_string(elem(i, 1), 16)} end) |> IO.inspect()
            bxor(first, second)
          end)
          |> Enum.map(fn i -> Integer.to_string(i, 16) end)
      else
        temp
      end

    wNew =
      Enum.zip(w |> Enum.at(i - 4), temp)
      |> Enum.map(fn pair ->
        first = pair |> elem(0) |> Integer.parse(16) |> elem(0)
        second = pair |> elem(1) |> Integer.parse(16) |> elem(0)

        # [f: first, s: second] |> Enum.map(fn i -> {elem(i, 0), Integer.to_string(elem(i, 1), 16)} end) |> IO.i`nspect()
        bxor(first, second)
      end)
      |> Enum.map(fn i -> Integer.to_string(i, 16) end)

    w ++ [wNew]

    # wCur = key |> Enum.at(i)
  end
end

key = "TwoThousandNine!"

plaintext = "The Best College"

to_hex = fn string ->
  string
  |> String.to_charlist()
  |> Enum.map(fn c -> c |> Integer.to_string(16) end)
end

# getRoundKey = fn i ->

# end
# function getRoundKey(i) {
# 	if (i == 1) {
# 		return 1;
# 	}
# 	lastRc = getRoundKey(i - 1);
# 	if (i > 1 && lastRc < parseInt('80', 16)) {
# 		return 2 * lastRc;
# 	}
# 	if (i > 1 && lastRc >= parseInt('80', 16)) {
# 		return (2 * lastRc) ^ parseInt('11B', 16);
# 	}
# 	throw new Error('out of bounds round key');
# }

key =
  key
  |> IO.inspect()
  |> to_hex.()
  |> IO.inspect()

IO.puts("")

plaintext
|> IO.inspect()
|> to_hex.()
|> IO.inspect()

# 1..10 |> Enum.map(fn i -> AES.getRoundKey(i) |> Integer.to_string(16) end) |> IO.inspect()

# rcon = fn i ->
#   [AES.getRoundKey(i), 0, 0, 0]
#   |> Enum.map(fn c -> c |> Integer.to_string(16) end)
# end

# rot_word = fn w ->
#   tl(w) ++ [hd(w)]
# end

key
|> Enum.chunk_every(4)
|> IO.inspect()
# |> Enum.take(1)
# |> Enum.map(fn chunk ->
#   AES.rotWord(chunk)
# end)
# |> IO.inspect()
|> AES.generateWordChunks(10)
|> IO.inspect()
|> Enum.with_index()
|> IO.inspect()

# 1..10 |> Enum.map(fn i -> rcon.(i) end) |> IO.inspect()

# wordsToGenerate = 1..10

# AES.subWord(0x28) |> Integer.to_string(16) |> IO.inspect()
