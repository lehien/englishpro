module StaticPagesHelper
    
    def current_plan_explanation(plan)
        result = "#{plan.created_at.to_date}から#{plan.deadline}までに、#{plan.how_many}個の単語を勉強する"
        #if (plan.act.eql? "Study") then result+= "レッソン#{plan.how_many}つを勉強する"
        #elsif (plan.act.eql? "Test") then result += "テスト#{plan.how_many}題を合格する"
        #else result += "#{plan.act}#{plan.how_many}つをする"
        #end
        return result
    end
    
    def plan_explanation(plan, a)
        result = "#{plan.created_at.to_date}から#{plan.deadline}までに、#{plan.how_many}個の単語を勉強する"
        #if (plan.act.eql? "Study") then result+= "レッソン#{plan.how_many}つを勉強する"
        #elsif (plan.act.eql? "Test") then result += "テスト#{plan.how_many}題を合格する"
        #else result += "#{plan.act}#{plan.how_many}つをする"
        #end
        return result
    end
    
    def plan_completed(plan)
        result = "#{plan.task_completed}個の単語を勉強した"
        #if (plan.act.eql? "Study") then result = "#{plan.task_completed}つのレッソンを勉強した"
        #elsif (plan.act.eql? "Test") then result = "#{plan.task_completed}題のテストを合格した"
        #else result = "#{plan.task_completed}つの#{plan.act}をした"
        #end
        return result
    end
    
    def plan_left(plan)
        if (plan.is_completed) then result = "ゴール完成しました！おめでとうございます！"
        #elsif (plan.act.eql? "Study") then result = "ゴールを完成するために、まだ#{plan.how_many-plan.task_completed}つのレッソン残っている"
        #elsif (plan.act.eql? "Test") then result = "ゴールを完成するために、まだ#{plan.how_many-plan.task_completed}題のテスト残っている"
        elsif (plan.is_over?) then result = "このゴール、失敗しました…"
        else result = "ゴールを完成するために、まだ#{plan.how_many-plan.task_completed}個の単語残っている"
        end
        return result
    end
    
    def plan_suggestion(plan)
        if (plan.is_completed) then result = ""
        #elsif (plan.act.eql? "Study") then result = "一日、#{(Float(plan.how_many-plan.task_completed)/plan.day_remaining).round(2)}つのレッソン勉強するのを勧めます"
        #elsif (plan.act.eql? "Test") then result = "一日、#{(Float(plan.how_many-plan.task_completed)/plan.day_remaining).round(2)}題のテスト受験するのを勧めます"
        elsif (plan.is_over?) then result = ""
        else result = "一日、#{(Float(plan.how_many-plan.task_completed)/plan.day_remaining).round(2)}個の単語を勉強するのを勧めます"
        end
        return result
    end
    
    def chart_data_about_plan_completed(plan)
        plan.task_completed_chart_data
    end
    
    def chart_data_plan_ideal_suggestion(plan)
        day_array = (plan.created_at.to_date..plan.deadline.to_date).to_a
        Hash[day_array.collect {|day| [day, (plan.how_many)/Float(plan.deadline.to_date-plan.created_at.to_date+1)]}]
    end
end
