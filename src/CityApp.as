package
{
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;
	
	import feathers.utils.ScreenDensityScaleFactorManager;
	
	import starling.core.Starling;
	
	[SWF(width="320",height="480",frameRate="60",backgroundColor="#333333")]
	
	public class CityApp extends Sprite
	{
		
		private var myStarling:Starling;
		private var myScaler:ScreenDensityScaleFactorManager;

		public function CityApp()
		{
			if(this.stage)
			{
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
				this.stage.align = StageAlign.TOP_LEFT;
			}
			
			this.mouseEnabled = this.mouseChildren = false;
			this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}
		
		private function loaderInfo_completeHandler(event:Event):void
		{			
			Starling.multitouchEnabled = true;
			
			this.myStarling = new Starling(Main, this.stage, null, null, Context3DRenderMode.AUTO, "auto");
			this.myScaler = new ScreenDensityScaleFactorManager(this.myStarling);
			this.myStarling.enableErrorChecking = false;
			this.myStarling.skipUnchangedFrames = true;
			//this.myStarling.showStats = true;
			
			this.myStarling.start();									
			this.stage.addEventListener(Event.DEACTIVATE, stage_deactivateHandler, false, 0, true);
		}
				
		private function stage_deactivateHandler(event:Event):void
		{
			this.myStarling.stop();
			this.stage.addEventListener(Event.ACTIVATE, stage_activateHandler, false, 0, true);
		}
		
		private function stage_activateHandler(event:Event):void
		{
			this.stage.removeEventListener(Event.ACTIVATE, stage_activateHandler);
			this.myStarling.start();
		}
		
	}
}