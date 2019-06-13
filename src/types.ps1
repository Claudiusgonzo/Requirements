
class Requirement {
    [string] $Name
    [ValidateNotNullOrEmpty()]
    [string] $Describe
    [scriptblock] $Test
    [scriptblock] $Set
    [string[]] $DependsOn = @()
    [string] ToString() {
        return $this.Name
    }
}

enum Method {
    Test
    Set
    Validate
}

enum LifecycleState {
    Start
    Stop
}

class RequirementEvent {
    [datetime] $Date
    [Method] $Method
    [LifecycleState] $State
    [object] $Result
    [Requirement] $Requirement
    hidden Init([Requirement]$Requirement, [Method]$Method, [LifecycleState]$State, $Result) {
        $this.Date = Get-Date
        $this.Method = $Method
        $this.State = $State
        $this.Result = $Result
        $this.Requirement = $Requirement
    }
    RequirementEvent([Requirement]$Requirement, [Method]$Method, [LifecycleState]$State, $Result) {
        $this.Init($Requirement, $Method, $State, $Result)
    }
    RequirementEvent([Requirement]$Requirement, [Method]$Method, [LifecycleState]$State) {
        $this.Init($Requirement, $Method, $State, $null)
    }
}
