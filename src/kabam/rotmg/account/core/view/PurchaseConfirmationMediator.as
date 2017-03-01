package kabam.rotmg.account.core.view
{
   import robotlegs.bender.bundles.mvcs.Mediator;
   import kabam.rotmg.dialogs.control.CloseDialogsSignal;
   import com.company.assembleegameclient.ui.dialogs.Dialog;
   import flash.events.Event;
   
   public class PurchaseConfirmationMediator extends Mediator
   {
       
      
      [Inject]
      public var view:kabam.rotmg.account.core.view.PurchaseConfirmationDialog;
      
      [Inject]
      public var close:CloseDialogsSignal;
      
      public function PurchaseConfirmationMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.addEventListener(Dialog.LEFT_BUTTON,this.onYesClickHandler);
         this.view.addEventListener(Dialog.RIGHT_BUTTON,this.onNoClickHandler);
      }
      
      private function onYesClickHandler(param1:Event) : void
      {
         this.close.dispatch();
         this.view.confirmedHandler();
      }
      
      private function onNoClickHandler(param1:Event) : void
      {
         this.close.dispatch();
      }
      
      override public function destroy() : void
      {
         this.view.removeEventListener(Dialog.LEFT_BUTTON,this.onYesClickHandler);
         this.view.removeEventListener(Dialog.RIGHT_BUTTON,this.onNoClickHandler);
      }
   }
}