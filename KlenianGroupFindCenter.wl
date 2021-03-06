(* ::Package:: *)

BeginPackage @ "KlenianGroupFindCenter`";
If[Position[$Path, NotebookDirectory[]] === {}, AppendTo[$Path, NotebookDirectory[]]];

Needs @ "KlenianGroupHelpers`";

findCenter::usage = "";

Begin @ "`Private`";
Module[{},

	findCenter[cayley_List] := Module[{check},
		check[element_] := Select[element, # =!= Null &];
		Take[#, 1][[1, 1]] & /@ Select[
			check @ # & /@ Table[
				If[cayley[[i, j]] == cayley[[j, i]], {i, j}]
			,
				{i, Length @ cayley}
			,
				{j, Length @ cayley}
		], Length @ # == Length @ cayley &]
	];

];
End[];
EndPackage[];
