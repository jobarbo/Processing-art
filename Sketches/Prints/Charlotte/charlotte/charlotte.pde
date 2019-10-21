// P_4_1_2_01
//
// Generative Gestaltung – Creative Coding im Web
// ISBN: 978-3-87439-902-9, First Edition, Hermann Schmidt, Mainz, 2018
// Benedikt Groß, Hartmut Bohnacker, Julia Laub, Claudius Lazzeroni
// with contributions by Joey Lee and Niels Poldervaart
// Copyright 2018
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * image feedback process.
 *
 * KEYS
 * del, backspace      : clear screen
 * s                   : save png
 */

PImage img;


void setup() {
  img=loadImage("../charlotte.png");
  size(2530, 3492);
  image(img, 0, 50);
}

void draw() {
  int x1 = floor(random(width));
  int y1 = 50;

  int x2 = round(x1 + random(-7, 7));
  int y2 = round(y1 + random(-5, 5));

  int w = floor(random(10, 40));
  int h = height - 100;

  set(x2, y2, get(x1, y1, w, h));
}
