//: [Previous](@previous)

import Foundation


public class Sort<T:Comparable>
{
    //uses ~ N2 / 2 compares and N exchanges to sort an array of length N.
    public class func selectionSort(inout array: [T])
    {
        let count = array.count
        
        for var i=0; i < count; i++ {
            var min = i
            for var j=i+1; j < count; j++ {
                if array[j] < array[min] {
                    min = j
                }
            }
            exchange(&array, i, min)
        }
    }
    
    //Best case. If the array is in ascending order, insertion sort makes N-1 compares and 0 exchanges.
    //Worst case. If the array is in descending order (and no duplicates), insertion sort makes ~1/2 N2 compares and ~1/2 N2 exchanges.
    public class func insertionSort(inout array: [T])
    {
        let count = array.count
        
        for var i = 0; i < count; i++ {
            for var j = i; j > 0; j-- {
                if array[j] < array[j-1] {
                    exchange(&array, j, j-1)
                }
                else {
                    break
                }
            }
        }
    }
    
    
    //The worst-case number of compares used by shellsort with the 3x+1 increments is O(N3/2).
    //Useful in practice.
    //* fast unless array size is huge.
    //* Tiny, fixed footprint for code (used in embedded systems).
    //* Hardware sort prototype.
    public class func shellSort(inout array: [T])
    {
        let count = array.count
        
        var h = 1
        while (h < count/3) {
            h = 3*h + 1
        }
        
        while (h >= 1) {
            //h-sort the array.
            for var i = h; i < count; i++ {
                for var j = i; (j >= h && array[j] < array[j - h]); j -= h {
                    exchange(&array, j, j - h)
                }
            }
            h = h/3;
        }
    }
    
    private class func exchange<T:Comparable>(inout array: [T], _ i: Int, _ j: Int)
    {
        let temp = array[j]
        array[j] = array[i]
        array[i] = temp
    }
}


//convex hull
struct Point2D {
    let x,y: Double
    
    //判断3点是否成顺时针，逆时针，共线角度
    static func ccw (a: Point2D, b: Point2D, c: Point2D) -> Int {
        let area2 = (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)
        if area2 > 0 {
            return -1
        }
        else if area2 > 0 {
            return +1;
        }
        else {
            return 0;
        }
    }
}

//selectionSort
var arrayOfInt = [3,2,6,9]
var arrayOfString = ["abc", "zfg", "leg", "bee"]

var test_selectionSortInt = arrayOfInt
Sort.selectionSort(&test_selectionSortInt)
test_selectionSortInt

var test_selectionSortString = arrayOfString
Sort.selectionSort(&test_selectionSortString)
test_selectionSortString

//insertionSort
var test_insertionSortInt = arrayOfInt
Sort.insertionSort(&test_insertionSortInt)
test_insertionSortInt

var test_insertionSortString = arrayOfString
Sort.insertionSort(&test_insertionSortString)
test_insertionSortString

//Shellsort
var arrayOfString_ss = ["s","o","r","t","e","x","a","m","p","l","e"]
Sort.shellSort(&arrayOfString_ss)
arrayOfString_ss

let a = Point2D(x: 1, y: 2)





public class MergeSort<T: Comparable> {
    
    private class func merge (inout a:[T], inout aux:[T], lo: Int, mid:Int, hi: Int) {
        var i = lo, j = mid+1
        
        for var k = lo; k <= hi; k++ {
            aux[k] = a[k]
        }
        
        for var k = lo; k <= hi; k++ {
            if i > mid {
                a[k] = aux[j++]
            } else if j > hi {
                a[k] = aux[i++]
            } else if aux[j] < aux[i] {
                a[k] = aux[j++]
            } else {
                a[k] = aux[i++]
            }
        }
    }
    
    private class func sort (inout a:[T], inout aux:[T], lo: Int, hi: Int) {
        if hi <= lo {
            return
        }
        let mid = lo + (hi - lo) / 2
        sort(&a, aux: &aux, lo: lo, hi: mid)
        sort(&a, aux: &aux, lo: mid+1, hi: hi)
        
        //already sorted, so return
        if !(a[mid+1] < a[mid]) {
            return
        }
        merge(&a, aux: &aux, lo: lo, mid: mid, hi: hi)
    }
    
    public class func sort (inout a:[T]) {
        var aux = [T]()
        aux.appendContentsOf(a)
        sort(&a, aux: &aux, lo: 0, hi: a.count - 1)
    }
    
    //bottom-up mergesort, no recursive
    public class func sortBU (inout a:[T]) {
        let N = a.count
        var aux = [T]()
        aux.appendContentsOf(a)
        for var sz = 1; sz < N; sz = sz + sz {
            for var lo = 0; lo < N - sz; lo += sz + sz {
                merge(&a, aux: &aux, lo: lo, mid: lo+sz-1, hi: min(lo+sz+sz-1, N-1))
            }
        }
    }
    
}


var arrayOfInt_mergeSort = [3,5,7,1,0,100,234,156,31]
MergeSort.sortBU(&arrayOfInt_mergeSort)
arrayOfInt_mergeSort

var arrayOfString_mergeSort = ["s","o","r","t","e","x","a","m","p","l","e"]
MergeSort.sort(&arrayOfString_mergeSort)
arrayOfString_mergeSort








