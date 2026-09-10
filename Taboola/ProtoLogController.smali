.class public Lcom/android/wm/shell/ProtoLogController;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"

# interfaces
.implements Lcom/android/wm/shell/sysui/ShellCommandHandler$ShellCommandActionHandler;


# instance fields
.field public final mShellCommandHandler:Lcom/android/wm/shell/sysui/ShellCommandHandler;

.field public final mShellProtoLog:Lcom/android/wm/shell/protolog/ShellProtoLogImpl;


# direct methods
.method public constructor <init>(Lcom/android/wm/shell/sysui/ShellInit;Lcom/android/wm/shell/sysui/ShellCommandHandler;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/android/wm/shell/ProtoLogController$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wm/shell/ProtoLogController$$ExternalSyntheticLambda0;-><init>(Lcom/android/wm/shell/ProtoLogController;)V

    invoke-virtual {p1, v0, p0}, Lcom/android/wm/shell/sysui/ShellInit;->addInitCallback(Ljava/lang/Runnable;Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/android/wm/shell/ProtoLogController;->mShellCommandHandler:Lcom/android/wm/shell/sysui/ShellCommandHandler;

    invoke-static {}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->getSingleInstance()Lcom/android/wm/shell/protolog/ShellProtoLogImpl;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wm/shell/ProtoLogController;->mShellProtoLog:Lcom/android/wm/shell/protolog/ShellProtoLogImpl;

    return-void
.end method


# virtual methods
.method public final onShellCommand(Ljava/io/PrintWriter;[Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    aget-object v1, p2, v0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x1

    sparse-switch v2, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v2, "disable"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x7

    goto :goto_1

    :sswitch_1
    const-string/jumbo v2, "start"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x6

    goto :goto_1

    :sswitch_2
    const-string/jumbo v2, "stop"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x5

    goto :goto_1

    :sswitch_3
    const-string v2, "save-for-bugreport"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x4

    goto :goto_1

    :sswitch_4
    const-string/jumbo v2, "status"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v1, 0x3

    goto :goto_1

    :sswitch_5
    const-string v2, "disable-text"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v1, 0x2

    goto :goto_1

    :sswitch_6
    const-string v2, "enable"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_0

    :cond_6
    move v1, v3

    goto :goto_1

    :sswitch_7
    const-string v2, "enable-text"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    goto :goto_0

    :cond_7
    move v1, v0

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    iget-object v2, p0, Lcom/android/wm/shell/ProtoLogController;->mShellProtoLog:Lcom/android/wm/shell/protolog/ShellProtoLogImpl;

    packed-switch v1, :pswitch_data_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid command: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object p2, p2, v0

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p2, ""

    invoke-virtual {p0, p1, p2}, Lcom/android/wm/shell/ProtoLogController;->printShellCommandHelp(Ljava/io/PrintWriter;Ljava/lang/String;)V

    return v0

    :pswitch_0
    array-length p0, p2

    invoke-static {p2, v3, p0}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    invoke-virtual {v2, p1, p0}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->stopTextLogging(Ljava/io/PrintWriter;[Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_8

    move v0, v3

    :cond_8
    return v0

    :pswitch_1
    invoke-virtual {v2, p1}, Lcom/android/internal/protolog/BaseProtoLogImpl;->startProtoLog(Ljava/io/PrintWriter;)V

    return v3

    :pswitch_2
    invoke-virtual {v2, p1, v3}, Lcom/android/internal/protolog/BaseProtoLogImpl;->stopProtoLog(Ljava/io/PrintWriter;Z)V

    return v3

    :pswitch_3
    invoke-virtual {v2}, Lcom/android/internal/protolog/BaseProtoLogImpl;->isProtoEnabled()Z

    move-result p0

    if-nez p0, :cond_9

    const-string p0, "Logging to proto is not enabled for WMShell."

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return v0

    :cond_9
    invoke-virtual {v2, p1, v3}, Lcom/android/internal/protolog/BaseProtoLogImpl;->stopProtoLog(Ljava/io/PrintWriter;Z)V

    invoke-virtual {v2, p1}, Lcom/android/internal/protolog/BaseProtoLogImpl;->startProtoLog(Ljava/io/PrintWriter;)V

    return v3

    :pswitch_4
    invoke-virtual {v2}, Lcom/android/internal/protolog/BaseProtoLogImpl;->getStatus()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return v3

    :pswitch_5
    array-length p0, p2

    invoke-static {p2, v3, p0}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    invoke-virtual {v2, p1, p0}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->stopTextLogging(Ljava/io/PrintWriter;[Ljava/lang/String;)I

    move-result p2

    if-nez p2, :cond_a

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Stopping logging on groups: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return v3

    :cond_a
    return v0

    :pswitch_6
    array-length p0, p2

    invoke-static {p2, v3, p0}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    invoke-virtual {v2, p1, p0}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->startTextLogging(Ljava/io/PrintWriter;[Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_b

    move v0, v3

    :cond_b
    return v0

    :pswitch_7
    array-length p0, p2

    invoke-static {p2, v3, p0}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    invoke-virtual {v2, p1, p0}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->startTextLogging(Ljava/io/PrintWriter;[Ljava/lang/String;)I

    move-result p2

    if-nez p2, :cond_c

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Starting logging on groups: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return v3

    :cond_c
    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x57eac4c9 -> :sswitch_7
        -0x4d6ada7d -> :sswitch_6
        -0x3d842b0e -> :sswitch_5
        -0x3532300e -> :sswitch_4
        -0x174ab7ac -> :sswitch_3
        0x360802 -> :sswitch_2
        0x68ac462 -> :sswitch_1
        0x639e22e8 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final printShellCommandHelp(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 0

    const-string/jumbo p0, "status"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  Get current ProtoLog status."

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string/jumbo p0, "start"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  Start proto logging."

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string/jumbo p0, "stop"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  Stop proto logging and flush to file."

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "enable [group...]"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  Enable proto logging for given groups."

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "disable [group...]"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  Disable proto logging for given groups."

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "enable-text [group...]"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  Enable logcat logging for given groups."

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "disable-text [group...]"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  Disable logcat logging for given groups."

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "save-for-bugreport"

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  Flush proto logging to file, only if it\'s enabled."

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return-void
.end method
