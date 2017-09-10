module Charts exposing (..)

import Array
import Date exposing (Date)
import Date.Extra.Format as Format exposing (utcIsoString)
import Date.Extra.Utils as Utils exposing (isoWeek)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Styles exposing (stylusString)
import StylusParser exposing (stylusToCss)
import OpenSolid.Geometry.Types exposing (..)
import OpenSolid.Vector2d as Vector2d
import OpenSolid.Point2d as Point2d
import String.Extra exposing (replace)
import Types exposing (..)
import BarChart exposing (..)
import Helpers exposing (..)


defaultBaseConfig : BaseConfigAnd {}
defaultBaseConfig =
    { title = "Vectual Chart"
    , inline = False
    , width = 400
    , height = 300
    , borderRadius = ( 2, 2 )
    , xLabelFormatter = utcDateTime
    }


viewChart : Chart -> Svg msg
viewChart chart =
    case chart of
        BarChart config data ->
            viewBarChart config data

        PieChart config data ->
            viewPieChart config data


viewPieChart : PieChartConfig -> Data -> Svg msg
viewPieChart config data =
    circle [ r "50" ] []
