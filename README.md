# convert-svg-to-png

Convert all SVG graphics in a specific directory to png files

# Objectives

This action is designed to convert all images in SVG (Scalable Vector Graphics) format located 
in a specified directory into PNG (Portable Network Graphics) format. The converted PNG images 
are then saved in a separate target directory. 

# Inputs

| NAME    | VALUE  | DEFAULT | DESCRIPTION                                                               |
| ------- | ------ | ------- | ------------------------------------------------------------------------- |
| svgpath | string | svg/    | The path where the SVG files will get picked                              |
| pngpath | string | png/    | The path where the PNG files will go                                      |
| zoom    | string | 1.0     | Zoom factor, as a percentage. If unspecified, 1.0 is used as the default. |

# Example Workflow file

```yaml
on: 
    push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout files
        uses: actions/checkout@master
     
      - name: Convert SVG
        uses: joergnapp/convert-svg-to-png@main
        with:
          svgpath: 'svg/'
          pngpath: 'png/'
          zoom: '4'

      - name: Commit files
        run: |
          git config user.name github-actions
          git config user.email github-actions@github.com
          git add png/*.png
          git commit -m "SVG to png" -a

      - name: Push changes
        uses: ad-m/github-push-action@master
        with:
          github_token: '${{ secrets.GITHUB_TOKEN }}'
          branch: '${{ github.ref }}'

```