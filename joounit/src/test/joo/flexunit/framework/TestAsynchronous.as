/*
   Copyright (c) 2008. Adobe Systems Incorporated.
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

     * Redistributions of source code must retain the above copyright notice,
       this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright notice,
       this list of conditions and the following disclaimer in the documentation
       and/or other materials provided with the distribution.
     * Neither the name of Adobe Systems Incorporated nor the names of its
       contributors may be used to endorse or promote products derived from this
       software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
*/
package flexunit.framework
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flexunit.framework.Assert;

   public class TestAsynchronous extends TestCase
   {
       public function TestAsynchronous(name : String = null)
       {
           super(name);
       }
   
       public function testInTimePass() : void
       {
           var test : TestCase = new AsynchronousTestCase("testInTimePass");
           var result : TestResult = test.run();
           initAsync(result, 1, 0, 0);
       }
   
       public function testInTimeFail() : void
       {
           var test : TestCase = new AsynchronousTestCase("testInTimeFail");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       //this test won't be run right now because the Error that is thrown propagates up and creates a dialog
       //and if the dialog isn't closed in time it screws up the timer in here.  however if you run it manaully and close
       //the dialog in time it should be ok
       public function STOPtestInTimeError() : void
       {
           var test : TestCase = new AsynchronousTestCase("testInTimeError");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       public function testTooLatePass() : void
       {
           var test : TestCase = new AsynchronousTestCase("testTooLatePass");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       public function testTooLateFail() : void
       {
           var test : TestCase = new AsynchronousTestCase("testTooLateFail");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       //this test won't be run right now because the Error that is thrown propagates up and creates a dialog
       //and if the dialog isn't closed in time it screws up the timer in here.  however if you run it manaully and close
       //the dialog in time it should be ok
       public function STOPtestTooLateError() : void
       {
           var test : TestCase = new AsynchronousTestCase("testTooLateError");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       public function testSecondInTimePass() : void
       {
           var test : TestCase = new AsynchronousTestCase("testSecondInTimePass");
           var result : TestResult = test.run();
           initAsync(result, 1, 0, 0);
       }
   
       public function testSecondInTimeFail() : void
       {
           var test : TestCase = new AsynchronousTestCase("testSecondInTimeFail");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       public function testSecondTooLatePass() : void
       {
           var test : TestCase = new AsynchronousTestCase("testSecondTooLatePass");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       public function testSecondTooLateFail() : void
       {
           var test : TestCase = new AsynchronousTestCase("testSecondTooLateFail");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       public function testTimeoutFunctionPass() : void
       {
           var test : TestCase = new AsynchronousTestCase("testTimeoutFunctionPass");
           var result : TestResult = test.run();
           initAsync(result, 1, 0, 0);
       }
   
       public function testTimeoutFunctionFail() : void
       {
           var test : TestCase = new AsynchronousTestCase("testTimeoutFunctionFail");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       public function testNotReallyAsynchronousPass() : void
       {
           var test : TestCase = new AsynchronousTestCase("testNotReallyAsynchronousPass");
           var result : TestResult = test.run();
           initAsync(result, 1, 0, 0);
       }
   
       public function testNotReallyAsynchronousFail() : void
       {
           var test : TestCase = new AsynchronousTestCase("testNotReallyAsynchronousFail");
           var result : TestResult = test.run();
           initAsync(result, 1, 1, 0);
       }
   
       public function shouldBeRun(event : Event, passedData : Object) : void
       {
           var result : TestResult = passedData.result;
           var expectedRun : int = passedData.expectedRun;
           var expectedFail : int = passedData.expectedFail;
           var expectedError : int = passedData.expectedError;
   
           Assert.assertEquals("result.runCount() is not correct", expectedRun, result.runCount());
           Assert.assertEquals("result.failureCount() is not correct",expectedFail, result.failureCount());
           Assert.assertEquals("result.errorCount() is not correct", expectedError, result.errorCount());
       }
   
       private function initAsync(result : TestResult, expectedRun : int, expectedFail : int, expectedError : int):void
       {
           var data : Object = new Object();
           data.result = result;
           data.expectedRun = expectedRun;
           data.expectedFail = expectedFail;
           data.expectedError = expectedError;
           var t : Timer = new Timer(1000, 1);
           var helper : Function = addAsync(shouldBeRun, 1500, data, function():void { Assert.fail('shouldBeRun did not fire');} );
           t.addEventListener( TimerEvent.TIMER, helper );
           t.start();
       }
   }
}