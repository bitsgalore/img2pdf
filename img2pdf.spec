# -*- mode: python -*-
a = Analysis(['.\src\img2pdf.py'],
             pathex=['.\src'],
             hiddenimports=[],
             hookspath=None)
pyz = PYZ(a.pure)
exe = EXE(pyz,
          a.scripts,
          exclude_binaries=1,
          name=os.path.join('build\\pyi.win32\\img2pdf', 'img2pdf.exe'),
          debug=False,
          strip=None,
          upx=True,
          console=True )

tests_tree = Tree('./src/tests', prefix = 'tests')

coll = COLLECT(exe,
               a.binaries,
               tests_tree,
               a.zipfiles,
               a.datas,
               strip=None,
               upx=True,
               name=os.path.join('dist', 'img2pdf'))
