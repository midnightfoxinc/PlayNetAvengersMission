.class Lcom/disneymobile/mocha/support/UIApplication$2;
.super Ljava/lang/Object;
.source "UIApplication.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/support/UIApplication;->registerForRemoteNotificationTypes(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/mocha/support/UIApplication;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/support/UIApplication;)V
    .locals 0

    .prologue
    .line 124
    iput-object p1, p0, Lcom/disneymobile/mocha/support/UIApplication$2;->this$0:Lcom/disneymobile/mocha/support/UIApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 126
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->standardUserDefaults()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "prefs_notifications_enabled"

    invoke-virtual {v0, v1, v2}, Lcom/disneymobile/mocha/NSUserDefaults;->setBooleanForKey(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/disneymobile/mocha/support/UIApplication$2;->this$0:Lcom/disneymobile/mocha/support/UIApplication;

    invoke-virtual {v0}, Lcom/disneymobile/mocha/support/UIApplication;->onNotificationSettingChange()V

    .line 128
    return-void
.end method
