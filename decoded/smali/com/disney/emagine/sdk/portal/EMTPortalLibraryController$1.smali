.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;
.super Ljava/lang/Object;
.source "EMTPortalLibraryController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->transferContent(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field final synthetic val$completion:Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;

.field final synthetic val$deviceId:I

.field final synthetic val$manifestItem:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/util/HashMap;ILcom/disney/emagine/sdk/completion/EMTManifestCompletion;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 711
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iput-object p2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;->val$manifestItem:Ljava/util/HashMap;

    iput p3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;->val$deviceId:I

    iput-object p4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;->val$completion:Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 714
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$000(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;->val$manifestItem:Ljava/util/HashMap;

    iget v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;->val$deviceId:I

    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;->val$completion:Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;

    invoke-virtual {v0, v1, v2, v3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sendMission(Ljava/util/HashMap;ILcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;)V

    .line 715
    return-void
.end method
