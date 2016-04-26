module MyDatabase where

import Database.Persist.TH
import Data.Text (Text)

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
  Person json
    name Text
    age Int
|]
