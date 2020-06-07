<#
 Comment based help
#>
Function Verb-Noun {

    [CmdletBinding()]
    Param(
        [parameter(ValueFromPipeline=$true)]
        [int]$price
    )

    Begin{
        $total = 0
    }
    Process{
        $total += $price
    }
    End{
        "total = $total"
    }
}

